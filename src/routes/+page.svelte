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

        <!-- Footer -->
        <footer class="relative z-10 border-t border-purple-500/20 mt-16 py-8 text-center text-gray-400/60">
            <p>© 2026 Finding Focus Productions</p>
        </footer>
    </div>
</div>