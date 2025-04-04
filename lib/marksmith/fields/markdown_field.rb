module Marksmith
  module Fields
    class MarkdownField < Avo::Fields::BaseField
      def initialize(id, **args, &block)
        @media_library = args[:media_library].nil? ? true : args[:media_library]

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
