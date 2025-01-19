module Marksmith
  module Helper
    def marksmith_tag(name, options_or_src = [], render_in: {}, include_blank: nil, **kwargs, &block)
      # options, src = hw_extract_options_and_src options_or_src, render_in, include_blank
      options = {}
      src = nil

      # component = HotwireCombobox::Component.new self, name, options: options, async_src: src, **kwargs
      render partial: "marksmith/shared/editor", locals: { name: name, foo: :bar, options: options, src: src, **kwargs }
      # "renderd"
    end

    def svg(name, options = {})
      image_tag asset_path("marksmith/svgs/#{name}.svg"), options
    end
  end
end
