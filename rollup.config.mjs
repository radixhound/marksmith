// import * as url from "url"
// import alias from "@rollup/plugin-alias"
import resolve from "@rollup/plugin-node-resolve"
// import { nodeResolve } from "@rollup/plugin-node-resolve";
import config from "./package.json" with { type: "json" }

// const __dirname = url.fileURLToPath(new URL(".", import.meta.url))
const banner = `/*!\nMarksmith ${config.version}\n*/`

const commonOutput = {
  name: "Marksmith",
  format: "es",
  inlineDynamicImports: true,
  globals: {
    "@hotwired/stimulus": "Stimulus"
  },
  banner
}

const input = "app/frontend/entrypoints/javascript/controllers/marksmith_controller.js"

const plugins = [resolve()]

export default [
  {
    input,
    output: [
      {
        file: "dist/marksmith-controller.esm.js",
        ...commonOutput
      }
    ],
    plugins,
    external: [
      "@hotwired/stimulus",
      "@rails/activestorage",
      "@rails/request.js",
      "@github/markdown-toolbar-element",
      "@github/paste-markdown"
    ],
  },
  {
    input,
    output: [
      {
        file: "dist/marksmith-full.esm.js",
        ...commonOutput
      }
    ],
    plugins,
  }
]
