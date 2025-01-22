# Marksmith

Marksmith a a GitHub-style markdown editor for Rails apps.

It supports Active Storage attachments and renders the mardown preview.

## Usage
How to use my plugin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "marksmith"
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:
```bash
$ bundle add marksmith
```

Install the NPM package to import the StimulusJS controller.

```bash
$ yarn add @avo-hq/marksmith

# or

$ npm install @avo-hq/marksmith
```


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Troubleshooting

If you ever get a 431 error from Vite, clear your brower's cache for `localhost` (chrome://settings/content/all?searchSubpage=localhost).

## Releasing

Run `bin/release x.y.z`, use `--dry` to skip publishing. This is not idempotent. If releasing fails, take note of where the process left off and continue manually.

### Details

In development we use `vite-rails` to compile and reload JS & CSS changes.

When releasing we use `rollup` to compile the StimulusJS controller and `@tailwindcss/cli` to compile the CSS.

The JS code is pushed to npmjs.org on `@avo-hq/marksmith` and the CSS file is shipped in the gem.
