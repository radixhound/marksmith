# Marksmith

Marksmith is a GitHub-style markdown editor for Rails apps.

It supports Active Storage attachments and comes with a built-in mardown preview renderer.

## Usage

```erb
<%= marksmith_tag :body %>
```

## Installation

### 1. Add `marksmith` to your `Gemfile`

Have Bundler add it by running this command:

```bash
bundle add marksmith
```

Or manually install it.

Add this line to your application's Gemfile:

```ruby
gem "marksmith"
```

And then execute:

```bash
bundle
```


### 2. Install the NPM package to import the StimulusJS controller.

Install the package.

```bash
yarn add @avo-hq/marksmith
# or
npm install @avo-hq/marksmith
```

Import and register it in your application.

```js
import Marksmith from '@avo-hq/marksmith'

application.register('marksmith', Marksmith)
```

> [!NOTE]
> Marksmith comes bundled with a few dependencies by default.
> If you want to manually import those dependencies and import only the controller from the package use the `/controller` path.

```js
// Import just the controller
import Marksmith from '@avo-hq/marksmith/controller'

application.register('marksmith', Marksmith)

// Manually import Marksmith's dependencies
import '@github/markdown-toolbar-element'
import { DirectUpload } from '@rails/activestorage'
import { post } from '@rails/request.js'
import { subscribe } from '@github/paste-markdown'
```

### 3. Add the style tag to your `application.html` layout

```erb
<%= stylesheet_link_tag "marksmith" %>
```

### 4. Use it

Use it a simple tag or attach it to your form builder.

```erb
<%= marksmith_tag :body, value: "### This is important" %>
<%= @form.marksmith @field.id%>
```

## Options

The field supports some of the regular options like `disabled`, `placeholder`, `autofocus`, `style`, `class`, `rows`, `data`, and `value`, but also a custom one.

`extra_preview_params` - Sends extra params to the preview renderer.

## Built-in preview renderer

The renderer is powered by [`Redcarpet`](https://github.com/vmg/redcarpet).
It supports basic styles for headings, `strong`, `italic` and others.

## Active Storage

The field supports Actve Storage uploads using drag and drop and pasting files into the field.

## Contributing

Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Other Open-Source Work

- [`active_storage-blurhash`](https://github.com/avo-hq/active_storage-blurhash) - A plug-n-play [blurhash](https://blurha.sh/) integration for images stored in ActiveStorage
- [`avo`](https://github.com/avo-hq/avo) - Build Internal Tools with Ruby on Rails
- [`class_variants`](https://github.com/avo-hq/class_variants) - Easily configure styles and apply them as classes. Very useful when you're implementing Tailwind CSS components and call them with different states.
- [`prop_initializer`](https://github.com/avo-hq/prop_initializer) - A flexible tool for defining properties on Ruby classes.
- [`stimulus-confetti`](https://github.com/avo-hq/stimulus-confetti) - The easiest way to add confetti to your StimulusJS app

## Try Avo ⭐️

If you enjoyed this gem try out [Avo](https://github.com/avo-hq/avo). It helps developers build Internal Tools, Admin Panels, CMSes, CRMs, and any other type of Business Apps 10x faster on top of Ruby on Rails.

## Troubleshooting

If you ever get a 431 error from Vite, clear your brower's cache for `localhost` (chrome://settings/content/all?searchSubpage=localhost).

## Releasing

Run `bin/release x.y.z`, use `--dry` to skip publishing. This is not idempotent. If releasing fails, take note of where the process left off and continue manually.

### Details

In development we use `vite-rails` to compile and reload JS & CSS changes.

When releasing we use `rollup` to compile the StimulusJS controller and `@tailwindcss/cli` to compile the CSS.

The JS code is pushed to npmjs.org on `@avo-hq/marksmith` and the CSS file is shipped in the gem.
