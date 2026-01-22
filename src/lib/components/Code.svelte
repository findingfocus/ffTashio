<script lang="ts">
    import { onMount } from 'svelte';
    import Prism from 'prismjs';

    import 'prismjs/components/prism-typescript';
    import 'prismjs/components/prism-jsx';
    import 'prismjs/components/prism-css';
    import 'prismjs/components/prism-bash';
    import 'prismjs/components/prism-c';
    import 'prismjs/components/prism-ruby';
    import 'prismjs/components/prism-python';

    const { language = 'javascript', code = '' } = $props();

    let element: HTMLElement;

    onMount(() => {
        if (element) {
            Prism.highlightElement(element);
        }
    });

    $effect(() => {
        if (element && code) {
            Prism.highlightElement(element);
        }
    });
</script>

<pre><code bind:this={element} class="language-{language}">{code}</code></pre>

<style>
    pre {
        background-color: #101828;
        border: 1px solid color-mix(in oklab, var(--color-blue-800) 30%, transparent);
        box-shadow: 0 4px 6px -1px rgba(25, 23, 36, 0.2);
        padding: 1rem;
        border-radius: 0.75rem;
        overflow: auto;
        font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
        font-size: 0.9em;
    }

    pre code {
        background: transparent;
        color: #e0def4; /* Base text color */
    }

    /* Rose Pine Theme for Prism.js - Simplified */
    :global(.token.comment) {
        color: #908caa; /* Muted */
    }

    :global(.token.punctuation) {
        color: #908caa;
    }

    :global(.token.tag),
    :global(.token.constant),
    :global(.token.deleted) {
        color: #eb6f92; /* Rose */
    }

    :global(.token.boolean),
    :global(.token.number) {
        color: #f6c177; /* Gold */
    }

    :global(.token.string),
    :global(.token.char),
    :global(.token.builtin),
    :global(.token.inserted) {
        color: #9ccfd8; /* Foam */
    }

    :global(.token.operator),
    :global(.token.entity),
    :global(.token.url) {
        color: #c4a7e7; /* Iris */
    }

    :global(.token.keyword) {
        color: #c4a7e7; /* Iris */
    }

    :global(.token.function),
    :global(.token.class-name) {
        color: #ebbcba; /* Pine */
    }

    :global(.token.variable) {
        color: #f6c177; /* Gold */
    }

    :global(.token.bold) {
        font-weight: bold;
    }

    :global(.token.italic) {
        font-style: italic;
    }
</style>
