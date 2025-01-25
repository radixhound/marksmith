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
        # The manifest will expose the asset files to the main app.
        app.config.assets.precompile << "marksmith_manifest.js"
      end
    end

    initializer "avo-markdown_field.init" do |app|
      if defined?(Avo)
        require "marksmith/fields/markdown_field"

        app.routes.append do
          mount Marksmith::Engine => "/marksmith"
        end

        ActiveSupport.on_load(:avo_boot) do
          Avo.plugin_manager.register :marksmith_field

          Avo.plugin_manager.register_field :markdown, Marksmith::Fields::MarkdownField
          Avo.plugin_manager.register_field :marksmith, Marksmith::Fields::MarkdownField

          Avo.asset_manager.add_stylesheet "marksmith"
          Avo.asset_manager.add_javascript "marksmith_controller-no-stimulus.esm"
          Avo.asset_manager.add_javascript "list_continuation_controller-no-stimulus.esm"

          Avo.asset_manager.register_stimulus_controller "marksmith", "MarksmithController"
          Avo.asset_manager.register_stimulus_controller "list-continuation", "ListContinuationController"
        end
      end
    end
  end
end
