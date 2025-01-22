module Marksmith
  class Engine < ::Rails::Engine
    isolate_namespace Marksmith

    initializer "marksmith.view_helpers" do
      ActiveSupport.on_load :action_view do
        require "marksmith/helper"
        ActionView::Base.include Marksmith::Helper

        module FormBuilderExtensions
          def marksmith(*args, **kwargs, &block)
            @template.marksmith_tag(*args, **kwargs.merge(form: self), &block)
          end
        end

        ActionView::Helpers::FormBuilder.include FormBuilderExtensions
      end
    end

    initializer "marksmith.assets.precompile" do |app|
      if Rails.application.config.respond_to?(:assets)
        app.config.assets.precompile << "marksmith_manifest.js"
      end
    end
  end
end
