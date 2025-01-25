// import * as url from "url"
// import alias from "@rollup/plugin-alias"
import resolve from "@rollup/plugin-node-resolve"
// import { nodeResolve } from "@rollup/plugin-node-resolve";
import config from "./package.json" with { type: "json" }
import startCase from "lodash/startCase.js"
import camelCase from "lodash/camelCase.js"
import upperFirst from "lodash/upperFirst.js"

// const __dirname = url.fileURLToPath(new URL(".", import.meta.url))
const banner = `/*!\nMarksmith ${config.version}\n*/`

const commonOutput = {
  name: "MarksmithController",
  format: "es",
  inlineDynamicImports: true,
  globals: {
    "@hotwired/stimulus": "Stimulus"
  },
  banner
}

const input = "app/frontend/entrypoints/javascript/controllers/export.js"

const plugins = [resolve()]

const configFor = (controllerName) => {
  const fileName = `${controllerName}_controller`
  const className = upperFirst(camelCase(startCase(fileName)))
  const inputPath = `app/frontend/entrypoints/javascript/controllers/${fileName}.js`
  const nonStimulusDeps = [
    "@rails/activestorage",
    "@rails/request.js",
    "@github/markdown-toolbar-element",
    "@github/paste-markdown"
  ]
  const versions = {
    full: {
      external: []
    },
    "no-stimulus": {
      external: [
        "@hotwired/stimulus",
      ]
    },
  }
  const finalConfig = []
  Object.keys(versions).forEach((name) => {
    const payload = versions[name]
    const outputPath = `app/assets/javascripts/${fileName}-${name}.esm.js`
    const config = {
      input: inputPath,
      output: {
        ...commonOutput,
        file: outputPath,
        format: "iife",
        name: className,
        globals: {
          // Avo knows to expose the Stimulus Controller to the global window object using the FakeStimulus object.
          "@hotwired/stimulus": "FakeStimulus"
        }
      },
      plugins,
      external: payload.external,
    }

    finalConfig.push(config)
  })

  return finalConfig
}

const avoExports = [
  ...configFor("marksmith"),
  ...configFor("list_continuation")
]

// console.log(avoExports)

export default [
  {
    input,
    output: [
      {
        file: "dist/marksmith-core.esm.js",
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
        file: "dist/marksmith.esm.js",
        ...commonOutput
      }
    ],
    plugins,
  },
  ...avoExports
]
