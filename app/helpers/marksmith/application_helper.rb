module Marksmith
  module ApplicationHelper
    # # Override: Returns the engine assets manifest.
    # def vite_manifest
    #   Administrator::Engine.vite_ruby.manifest
    # end
    def marky_tag(name, options_or_src = [], render_in: {}, include_blank: nil, **kwargs, &block)
      # options, src = hw_extract_options_and_src options_or_src, render_in, include_blank
      # component = HotwireCombobox::Component.new self, name, options: options, async_src: src, **kwargs
      # render component, &block
      "renderd"
    end
  end
end
