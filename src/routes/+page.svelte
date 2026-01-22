<script>
    import { onMount } from "svelte";
    import { browser } from '$app/environment';
    import Tashio from '$lib/components/Tashio.svelte';

    let showTashio = false;

    onMount(() => {
        showTashio = true;

        const originalTitle = "Finding Focus";
        const observer = new MutationObserver((mutations) => {
            if (document.title !== originalTitle) {
                document.title = originalTitle;
            }
        });

        const titleElement = document.querySelector('title');
        if (titleElement) {
            observer.observe(titleElement, {
                childList: true,
                characterData: true,
                subtree: true
            });
        }

        return () => {
            observer.disconnect();
        };
    });
</script>

<div class="relative w-full h-screen">
    <img src="volcano.webp" alt="Volcano" class="fixed inset-0 w-full h-full object-cover -z-10">
    <div class="fixed inset-0 bg-gradient-to-b from-purple-800/60 to-[#1a0f2e] pointer-events-none -z-5"></div>
    <div class="relative z-10">
        <div class="relative flex justify-center h-24 md:h-42 lg:h-56 inset-0 bg-gradient-to-b from-purple-950/80 to-purple-900/30">
            <img src="tashiotempologo.webp" alt="Logo">
            <img src="tashio.webp" alt="Logo">
        </div>
        <div class="flex flex-col-reverse md:grid md:grid-cols-2 md:gap-8 items-start mb-4">
            <div class="mx-2 md:mb-0 md:ml-8">
                <p class="text-base mb-4 text-blue-100 mt-4">
                    <a href="https://www.github.com/findingfocus/tashio" target="_blank" rel="noopener noreferrer" class="link text-cyan-500 hover:text-cyan-400 transition duration-150">Tashio Tempo</a>
                    is my new top-down game filled with adventure, magic, and music. The current version features geckos, bats, spell-casting abilities, and a dungeon to explore!
                </p>

                <div class="mt-4 text-center p-4 bg-gray-900 border border-blue-800/30 shadow shadow-blue-900/20 rounded-xl max-w-md md:max-w-none">
                    <h3 class="font-bold mb-3 text-white">CONTROLS</h3>
                    <div class="grid grid-cols-2 gap-2 text-blue-100 font-mono">
                        <div>'WASD'</div><div>DPAD</div>
                        <div>'P or SPACE'</div><div>A BUTTON</div>
                        <div>'O or SHIFT'</div><div>B BUTTON</div>
                        <div>'`'</div><div>SELECT BUTTON</div>
                        <div>'TAB'</div><div>START BUTTON</div>
                        <div>'M'</div><div>MUSIC TOGGLE</div>
                    </div>
                </div>
            </div>

            <div class="flex flex-col items-center w-full md:w-auto">
                <div class="w-full max-w-md">
                    {#if browser && showTashio}
                        <Tashio />
                    {:else}
                        <div class="flex justify-center items-center bg-gray-900 rounded-lg text-2xl p-4 h-[400px]">
                            <p class="text-blue-300">Loading Tashio Tempo...</p>
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>