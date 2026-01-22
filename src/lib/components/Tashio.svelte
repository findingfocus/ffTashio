<script lang="ts">
    import { onDestroy, onMount } from 'svelte';
    import { beforeNavigate } from "$app/navigation";
    import { browser } from '$app/environment';

    function preventContextMenu(event: MouseEvent): void {
        event.preventDefault();
    }

    declare global {
        interface Window {
            drawLoadingText: (text: string) => void;
            Module: any;
            Love: any;
            applicationLoad: () => void;
        }
    }

    let isInitialized = false;

    onMount(() => {
        if (!browser) return;

        const basePath = "/tashio/";

        const loadingCanvasElement = document.getElementById('loadingCanvas');
        if (!loadingCanvasElement) {
            console.error('Loading canvas not found');
            return;
        }

        const loadingContext = (loadingCanvasElement as HTMLCanvasElement).getContext('2d');
        if (!loadingContext) {
            console.error('Failed to get 2D context');
            return;
        }

        window.drawLoadingText = function(text: string): void {
            const canvas = loadingContext.canvas;
            loadingContext.fillStyle = "rgb(0, 0, 27)";
            loadingContext.fillRect(0, 0, canvas.scrollWidth, canvas.scrollHeight);
            loadingContext.font = '1.5em arial';
            loadingContext.textAlign = 'center';
            loadingContext.fillStyle = "rgb(11, 86, 117)";
            loadingContext.fillText(text, canvas.scrollWidth / 2, canvas.scrollHeight / 2);
            loadingContext.fillText("Powered By Emscripten.", canvas.scrollWidth / 2, canvas.scrollHeight / 4);
            loadingContext.fillText("Powered By LÖVE.", canvas.scrollWidth / 2, canvas.scrollHeight / 4 * 3);
        }

        window.onclick = function(): void { window.focus(); };

        window.addEventListener("keydown", function(e: KeyboardEvent): void {
            if([32, 37, 38, 39, 40].indexOf(e.keyCode) > -1) {
                e.preventDefault();
            }
        }, false);

        window.addEventListener('error', function(e: ErrorEvent): boolean {
            if (e.message && e.message.includes("bufQueue is undefined")) {
                console.warn("Audio buffer error suppressed");
                e.preventDefault();
                return true;
            }
            return false;
        }, true);

        window.Module = {
            arguments: ["game.love"],
            INITIAL_MEMORY: 20971520,
            printErr: function(text: string): void {
                console.error('LÖVE Error:', text);
            },
            print: function(text: string): void {
                console.log('LÖVE:', text);
            },
            canvas: (function() {
                const canvas = document.getElementById('canvas');
                return canvas;
            })(),
            locateFile: function(path: string, prefix: string): string {
                console.log(`Locating file: ${path} with prefix: ${prefix}`);
                return basePath + path;
            },
            setStatus: function(text: string): void {
                if (text) {
                    window.drawLoadingText(text);
                } else if (window.Module.remainingDependencies === 0) {
                    const loadingCanvas = document.getElementById('loadingCanvas');
                    const gameCanvas = document.getElementById('canvas');
                    if (loadingCanvas) loadingCanvas.style.display = 'none';
                    if (gameCanvas) gameCanvas.style.visibility = 'visible';
                }
            },
            totalDependencies: 0,
            remainingDependencies: 0,
            monitorRunDependencies: function(left: number): void {
                this.remainingDependencies = left;
                this.totalDependencies = Math.max(this.totalDependencies, left);
                window.Module.setStatus(left ? 'Preparing... (' + (this.totalDependencies-left) + '/' + this.totalDependencies + ')' : 'All downloads complete.');
            }
        };

        window.Module.setStatus('Downloading...');

        window.onerror = function(event: string | Event): void {
            console.error('Window error:', event);
            window.Module.setStatus('Exception thrown, see JavaScript console');
            window.Module.setStatus = function(text: string): void {
                if (text) window.Module.printErr('[post-exception status] ' + text);
            };
        };

        window.applicationLoad = function(): void {
            try {
                console.log("Starting LÖVE engine...");
                window.Love(window.Module);
            } catch (error) {
                console.error('Error in Love initialization:', error);
            }
        }

        try {
            fetch(basePath + 'game.love')
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    console.log("game.love fetch successful, getting array buffer...");
                    return response.arrayBuffer();
                })
                .then(buffer => {
                    console.log("game.love downloaded, size:", buffer.byteLength);
                    loadScripts();
                })
                .catch(error => {
                    console.error('Error fetching game.love:', error);
                    window.drawLoadingText("Failed to load game resources");
                });
        } catch (error) {
            console.error("Error in game setup:", error);
        }

        function loadScripts(): void {
            try {
                const gameScript = document.createElement('script');
                gameScript.src = basePath + "game.js";
                gameScript.onload = () => {
                    console.log("game.js loaded");
                    const loveScript = document.createElement('script');
                    loveScript.src = basePath + "love.js";
                    loveScript.onload = () => {
                        console.log("love.js loaded");
                        isInitialized = true;
                        window.applicationLoad();
                    };
                    loveScript.onerror = (e) => console.error('Failed to load love.js:', e);
                    document.body.appendChild(loveScript);
                };
                gameScript.onerror = (e) => console.error('Failed to load game.js:', e);
                document.body.appendChild(gameScript);
            } catch (error) {
                console.error("Error loading scripts:", error);
            }
        }
    });

    beforeNavigate((navigation) => {
        console.log("Navigation detected, will refresh on destroy...", navigation);
    });

    onDestroy(() => {
        if (browser && isInitialized) {
            console.log("Tashio component destroying, refreshing page...");
            window.location.reload();
        }
    });
</script>

{#if browser}
    <div class="flex flex-col items-center justify-center mx-auto my-0 max-h-[574px]">
        <canvas id="loadingCanvas" on:contextmenu={preventContextMenu} width="320" height="580" class="block translate-y-17"></canvas>
        <canvas id="canvas" class="invisible block my-0 p-0" on:contextmenu={preventContextMenu}></canvas>
    </div>
{:else}
    <div class="flex justify-center items-center bg-[rgb(0,0,27)] rounded-lg p-4 h-[400px]">
        <p class="text-[rgb(11,86,117)]">Loading Tashio Tempo...</p>
    </div>
{/if}