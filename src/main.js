import Reveal from "../node_modules/reveal.js/dist/reveal.mjs";
import Markdown from "../node_modules/reveal.js/dist/plugin/markdown.mjs";
import Notes from "../node_modules/reveal.js/dist/plugin/notes.mjs";
import Highlight from "../node_modules/reveal.js/dist/plugin/highlight.mjs";

const deck = new Reveal({
  hash: true,
  slideNumber: true,
  center: true,
  width: 1280,
  height: 720,
  margin: 0.08,
  plugins: [Markdown, Notes, Highlight],
});

deck.initialize();
