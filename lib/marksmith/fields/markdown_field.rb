module Marksmith
  module Fields
    class MarkdownField < Avo::Fields::BaseField
      attr_reader :extra_preview_params

      def initialize(id, **args, &block)
        @media_library = args[:media_library].nil? ? true : args[:media_library]
        @extra_preview_params = args[:extra_preview_params] || {}

        super(id, **args, &block)

        hide_on :index
      end

      def view_component_namespace
        "Marksmith::MarkdownField"
      end

      def gallery_enabled?
        Avo::MediaLibrary.configuration.enabled && @media_library
      end
    end
  end
end
