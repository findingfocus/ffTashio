<script>
    import { onMount } from "svelte";
    import { browser } from '$app/environment';
    import Tashio from '$lib/components/Tashio.svelte';

    let showTashio = false;

    onMount(() => {
        showTashio = true;
    });
    let expandedSection = null;

    function toggleSection(section) {
        expandedSection = expandedSection === section ? null : section;
    }
</script>

<style>
    :global(:root) {
        --header-color: rgb(194, 223, 255);
    }
</style>

<div class="relative w-full min-h-screen">
    <img src="volcano.webp" alt="Volcano" class="fixed inset-0 w-full h-full object-cover -z-10">
    <div class="fixed inset-0 bg-gradient-to-b from-purple-900/75 to-[#1a0f2e] pointer-events-none -z-5"></div>

    <div class="relative z-10">
        <!-- Header - unchanged -->
        <div class="relative flex justify-center h-24 md:h-42 lg:h-56 inset-0">
            <img src="tashiotempologo.webp" alt="Logo">
            <img src="tashio.webp" alt="Logo">
        </div>

        <!-- Main Content -->
        <main class="relative z-10 max-w-7xl mx-auto px-4 pt-0 md:pt-0">
            <!-- Centered wrapper for game + controls -->
            <div class="max-w-6xl mx-auto">
                <div class="flex flex-col lg:flex-row items-center lg:items-start justify-center gap-8 xl:gap-12 mt-0 md:mt-4 lg:mt-8">
                    <!-- Game Display -->
                    <div class="order-1 lg:order-2 flex justify-center w-full lg:w-auto lg:max-w-[65%]">
                        <div class="w-full h-[500px] md:h-[600px] lg:h-[700px]">
                            {#if browser && showTashio}
                                <Tashio />
                            {/if}
                        </div>
                    </div>

                    <!-- Controls - adjusted top padding per breakpoint -->
                    <section class="order-2 lg:order-1 space-y-4 flex flex-col items-center lg:items-start w-full lg:w-auto lg:min-w-[320px] pt-18 md:pt-0">
                        <!-- Changed: text-center → text-center lg:text-left -->
                        <h2 class="text-2xl font-bold text-[var(--header-color)] mb-6 text-center lg:text-left">
                            Controls
                        </h2>

                        <div class="grid grid-cols-2 gap-4 w-full max-w-md">
                            <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg p-4 transition duration-200">
                                <div class="text-[var(--header-color)] font-mono font-bold text-lg">WASD</div>
                                <div class="text-gray-300 text-sm mt-1">Movement</div>
                            </div>
                            <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg p-4 transition duration-200">
                                <div class="text-[var(--header-color)] font-mono font-bold text-lg">M</div>
                                <div class="text-gray-300 text-sm mt-1">Toggle Music</div>
                            </div>
                            <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg p-4 transition duration-200">
                                <div class="text-[var(--header-color)] font-mono font-bold text-lg">SPACE</div>
                                <div class="text-gray-300 text-sm mt-1">A Button</div>
                            </div>
                            <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg p-4 transition duration-200">
                                <div class="text-[var(--header-color)] font-mono font-bold text-lg">SHIFT</div>
                                <div class="text-gray-300 text-sm mt-1">B Button</div>
                            </div>
                            <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg p-4 transition duration-200">
                                <div class="text-[var(--header-color)] font-mono font-bold text-lg">Tab</div>
                                <div class="text-gray-300 text-sm mt-1">Start Button</div>
                            </div>
                            <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg p-4 transition duration-200">
                                <div class="text-[var(--header-color)] font-mono font-bold text-lg">Ctrl</div>
                                <div class="text-gray-300 text-sm mt-1">Select Button</div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!-- About Section -->
            <section class="space-y-4 mt-12 lg:mt-0 translate-y-0 md:-translate-y-0 lg:-translate-y-22 px-0 md:px-4 lg:px-40">
                <h2 class="text-2xl font-bold text-[var(--header-color)] mb-6">About the game</h2>
                <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg p-4 md:p-8 transition duration-200">
                    <div class="space-y-12">
                        <p class="text-blue-100/90 leading-relaxed text-lg">
                            Tashio Tempo is a top-down adventure game filled with magic and music! Learn to wield powerful spells that affect the environment around you.
                        </p>

                        <div class="border-l-0 md:border-l-4 border-[var(--header-color)] md:pl-6 pl-0 space-y-4">
                            <h3 class="text-xl font-bold text-[var(--header-color)] uppercase tracking-wider">Discover Old Magic</h3>
                            <p class="text-blue-100/80 leading-relaxed">Uncover ancient spells and unlock mystical abilities to overcome the challenges ahead.</p>
                            <video autoplay muted loop playsinline class="w-full rounded-lg pointer-events-none">
                                <source src="/BANNER1.mp4" type="video/mp4">
                            </video>
                        </div>

                        <div class="border-l-0 md:border-l-4 border-[var(--header-color)] md:pl-6 pl-0 space-y-4">
                            <h3 class="text-xl font-bold text-[var(--header-color)] uppercase tracking-wider">Master Your Lute</h3>
                            <p class="text-blue-100/80 leading-relaxed">Unique "Lute" system: Freely play music, or play songs from ancient tablature to interact with the world.</p>
                            <video autoplay muted loop playsinline class="w-full rounded-lg pointer-events-none">
                                <source src="/BANNER2.mp4" type="video/mp4">
                            </video>
                        </div>

                        <div class="border-l-0 md:border-l-4 border-[var(--header-color)] md:pl-6 pl-0 space-y-4">
                            <h3 class="text-xl font-bold text-[var(--header-color)] uppercase tracking-wider">Banish The Corruption</h3>
                            <p class="text-blue-100/80 leading-relaxed">Spell casting will cleanse creatures of their corruption, however they will remain dangerous until your music clears the corruption in each biome.</p>
                            <video autoplay muted loop playsinline class="w-full rounded-lg pointer-events-none">
                                <source src="/BANNER3.mp4" type="video/mp4">
                            </video>
                        </div>

                        <div class="border-t-2 border-blue-500/30 pt-8 space-y-6">
                            <div class="flex justify-center">
                                <a href="https://www.github.com/findingfocus/tashio" target="_blank" rel="noopener noreferrer" class="flex items-center gap-2 bg-green-700/50 hover:bg-green-600/60 transition duration-150 text-white px-6 py-3 rounded-2xl border border-green-500/30 backdrop-blur">
                                    <img src="/git-icon.svg" alt="Source Code" class="w-5 h-5">
                                    View Source Code
                                </a>
                            </div>
                            <div class="space-y-4">
                                <h3 class="text-lg font-bold text-[var(--header-color)] text-center">View Latest Release: <a href="https://github.com/findingfocus/tashio/releases/tag/v2.1.1" class="hover:text-red-500 transition duration-250">v2.1.1</a></h3>
                                <div class="flex flex-wrap gap-4 justify-center">
                                    <a href="https://github.com/findingfocus/tashio/releases/download/v2.1.1/Tashio_win64-v2.1.1.zip" class="flex items-center gap-2 bg-blue-600/50 hover:bg-blue-500/60 transition duration-250 text-white px-6 py-3 rounded-2xl border border-blue-400/30 backdrop-blur">
                                        <img src="/windows-icon.png" alt="Windows" class="w-5 h-5">
                                        Download
                                    </a>
                                    <a href="https://github.com/findingfocus/tashio/releases/download/v2.1.1/Tashio_osx-v2.1.1.zip" class="flex items-center gap-2 bg-blue-600/50 hover:bg-blue-500/60 transition duration-250 text-white px-6 py-3 rounded-2xl border border-blue-400/30 backdrop-blur">
                                        <img src="/apple-icon.png" alt="macOS" class="w-5 h-5">
                                        Download
                                    </a>
                                    <a href="https://github.com/findingfocus/tashio/releases/download/v2.1.1/Tashio_linux-v2.1.1.tar.gz" class="flex items-center gap-2 bg-blue-600/50 hover:bg-blue-500/60 transition duration-250 text-white px-6 py-3 rounded-2xl border border-blue-400/30 backdrop-blur">
                                        <img src="/linux-icon.png" alt="Linux" class="w-5 h-5">
                                        Download
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Installation Instructions Accordion (Outside About Box) -->
            <section class="space-y-4 mt-8 px-0 md:px-4 lg:px-40 lg:-translate-y-22">
                <h2 class="text-2xl font-bold text-[var(--header-color)] mb-6">Installation Instructions</h2>
                <div class="space-y-3">
                    <!-- Windows -->
                    <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg overflow-hidden">
                        <button on:click={() => toggleSection('windows')} class="w-full flex items-center justify-between p-4 hover:bg-blue-900/20 transition duration-250">
                            <h3 class="text-lg font-bold text-[var(--header-color)]">Windows</h3>
                            <span class="text-[var(--header-color)] transform transition-transform {expandedSection === 'windows' ? 'rotate-180' : ''}">▼</span>
                        </button>
                        {#if expandedSection === 'windows'}
                            <div class="px-4 pb-4 border-t border-blue-500/30 pt-4 space-y-2 text-blue-100/90">
                                <li class="list-none list-inside">- Download <a href="https://github.com/findingfocus/tashio/releases/download/v2.1.1/Tashio_win64-v2.1.1.zip" class="text-blue-300 hover:text-red-500 transition duration-250">Windows Release</a></li>
                                <li class="list-none list-inside">- Unzip the compressed folder</li>
                                <li class="list-none list-inside">- Double click the love-11.5-win64 folder</li>
                                <li class="list-none list-inside">- Double click the Tashio Tempo.exe</li>
                            </div>
                        {/if}
                    </div>

                    <!-- macOS -->
                    <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg overflow-hidden">
                        <button on:click={() => toggleSection('macos')} class="w-full flex items-center justify-between p-4 hover:bg-blue-900/20 transition duration-150">
                            <h3 class="text-lg font-bold text-[var(--header-color)]">MacOS</h3>
                            <span class="text-[var(--header-color)] transform transition-transform {expandedSection === 'macos' ? 'rotate-180' : ''}">▼</span>
                        </button>
                        {#if expandedSection === 'macos'}
                            <div class="px-4 pb-4 border-t border-blue-500/30 pt-4 space-y-2 text-blue-100/90">
                                <li class="list-none list-inside">- Download <a href="https://github.com/findingfocus/tashio/releases/download/v2.1.1/Tashio_osx-v2.1.1.zip" class="text-blue-300 hover:text-red-500 transition duration-250">Mac Release</a></li>
                                <li class="list-none list-inside">- Unzip the folder</li>
                                <li class="list-none list-inside">- Hold down the Control key and click on Tashio Tempo</li>
                                <li class="list-none list-inside">- Click Open</li>
                                <li class="list-none list-inside">If security error shows up, click cancel, then open Security and Privacy in Settings. Scroll down and allow executable to "run anyway" from unidentified developer.</li>
                            </div>
                        {/if}
                    </div>

                    <!-- Linux -->
                    <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg overflow-hidden">
                        <button on:click={() => toggleSection('linux')} class="w-full flex items-center justify-between p-4 hover:bg-blue-900/20 transition duration-150">
                            <h3 class="text-lg font-bold text-[var(--header-color)]">Linux</h3>
                            <span class="text-[var(--header-color)] transform transition-transform {expandedSection === 'linux' ? 'rotate-180' : ''}">▼</span>
                        </button>
                        {#if expandedSection === 'linux'}
                            <div class="px-4 pb-4 border-t border-blue-500/30 pt-4 space-y-2 text-blue-100/90">
                                <li class="list-none list-inside">- Download <a href="https://github.com/findingfocus/tashio/releases/download/v2.1.1/Tashio_linux-v2.1.1.tar.gz" class="text-blue-300 hover:text-red-500 transition duration-250">Linux Release</a></li>
                                <li class="list-none list-inside">- Unpack tarball: <code class="bg-black/30 px-2 py-1 rounded text-sm font-mono">tar -xzf Tashio_linux-v2.1.tar.gz</code></li>
                                <li class="list-none list-inside">- Run launcher: <code class="bg-black/30 px-2 py-1 rounded text-sm font-mono">./run.sh</code></li>
                            </div>
                        {/if}
                    </div>

                    <!-- Save File Location -->
                    <div class="bg-gradient-to-br from-blue-900/40 to-blue-900/30 backdrop-blur border border-blue-500/30 rounded-lg overflow-hidden">
                        <button on:click={() => toggleSection('save')} class="w-full flex items-center justify-between p-4 hover:bg-blue-900/20 transition duration-150">
                            <h3 class="text-lg font-bold text-[var(--header-color)]">FAQ</h3>
                            <span class="text-[var(--header-color)] transform transition-transform {expandedSection === 'save' ? 'rotate-180' : ''}">▼</span>
                        </button>
                        {#if expandedSection === 'save'}
                            <div class="px-4 pb-4 border-t border-blue-500/30 pt-4 text-blue-100/90">
                                <p class="mb-3">To erase the save file, navigate to:</p>
                                <li class="list-none list-inside pb-3">Windows <code class="bg-black/30 px-2 py-1 rounded text-sm font-mono">C:\Users\&lt;Username&gt;\AppData\Roaming\Tashio Tempo\</code></li>
                                <li class="list-none list-inside pb-3">MacOs <code class="bg-black/30 px-2 py-1 rounded text-sm font-mono">~/Library/Application Support/Tashio Tempo/</code></li>
                                <li class="list-none list-inside pb-3">Linux <code class="bg-black/30 px-2 py-1 rounded text-sm font-mono">~/.local/share/love/Tashio Tempo/</code></li>
                                Delete the savePlayerData.bin to erase the save file.
                            </div>
                        {/if}
                    </div>
                </div>
            </section>
        </main>
        <div class="relative text-center w-full flex items-center justify-center z-10 mt-6 lg:mt-0 lg:-translate-y-18 md:z-30 pb-0 md:pb-0 lg:-mb-20">
            <div class="flex justify-between items-center gap-5 px-4 py-3 w-full max-w-[360px] md:max-w-[400px] md:gap-8 md:px-0 md:py-4 ml-5">
                <a href="https://www.youtube.com/findingfocus" target="_blank" rel="noopener noreferrer" aria-label="YouTube Profile">
                    <svg class="w-16 h-16 md:w-16 md:h-16 fill-white hover:fill-[#FF0000] hover:scale-[1.05] transition duration-300 ease-in-out" viewBox="0 0 24 24">
                        <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.01 2.01 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.01 2.01 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31 31 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.01 2.01 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A100 100 0 0 1 7.858 2zM6.4 5.209v4.818l4.157-2.408z"/>
                    </svg>
                </a>
                <a href="https://www.github.com/findingfocus" target="_blank" rel="noopener noreferrer" aria-label="GitHub Profile">
                    <svg class="w-16 h-16 md:w-16 md:h-16 fill-white hover:fill-[#6CC644] hover:scale-[1.05] transition duration-300 ease-in-out" viewBox="0 0 24 24">
                        <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27s1.36.09 2 .27c1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.01 8.01 0 0 0 16 8c0-4.42-3.58-8-8-8"/>
                    </svg>
                </a>
                <a href="https://www.twitch.tv/findingfocusdev" target="_blank" rel="noopener noreferrer" aria-label="Twitch Profile">
                    <svg class="w-16 h-16 md:w-16 md:h-16 fill-white hover:fill-[#9146FF] hover:scale-[1.05] transition duration-300 ease-in-out" viewBox="0 0 24 24">
                        <path d="M3.857 0 1 2.857v10.286h3.429V16l2.857-2.857H9.57L14.714 8V0zm9.714 7.429-2.285 2.285H9l-2 2v-2H4.429V1.143h9.142z"/>
                        <path d="M11.857 3.143h-1.143V6.57h1.143zm-3.143 0H7.571V6.57h1.143z"/>
                    </svg>
                </a>
            </div>
        </div>
        <!-- Footer -->
        <footer class="relative z-10 border-t border-purple-500/20 mt-2 py-8 text-center text-gray-400/60">
            <p>© 2026 Finding Focus Productions</p>
        </footer>
    </div>
</div>