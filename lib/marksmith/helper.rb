module Marksmith
  module Helper
    def marksmithed(body)
      Marksmith::Renderer.new.renderer.render(body)
    end

    def marksmith_tag(name, **kwargs, &block)
      render partial: "marksmith/shared/editor", locals: { name: name, **kwargs }
    end

    def marksmith_asset_tags(*args, **kwargs)
      stylesheet_link_tag("marksmith", *args, **kwargs) +
      javascript_include_tag("marksmith.esm.js", *args, **kwargs)
    end

    # TODO: maybe inline svgs in the future
    def svg(name, options = {})
      image_tag asset_path("marksmith/svgs/#{name}.svg"), options
    end
  end
end
