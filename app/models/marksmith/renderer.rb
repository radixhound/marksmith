require "redcarpet"
require "rouge"

module Marksmith
  class Renderer
    def renderer
      ::Redcarpet::Markdown.new(
        ::Redcarpet::Render::HTML,
        tables: true,
        lax_spacing: true,
        fenced_code_blocks: true,
        space_after_headers: true,
        hard_wrap: true,
        autolink: true,
        strikethrough: true,
        underline: true,
        highlight: true,
        quote: true,
        with_toc_data: true
      )
    end
  end
end
