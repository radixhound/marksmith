module Marksmith
  class Renderer
    def initialize(body:)
      @body = body
    end

    def render
      if Marksmith.configuration.parser == "commonmarker"
        render_commonmarker
      else
        render_redcarpet
      end
    end

    def render_commonmarker
      Commonmarker.to_html(@body)
    end

    def render_redcarpet
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
