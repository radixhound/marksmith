module Marksmith
  module Fields
    class MarkdownField < Avo::Fields::BaseField
      def initialize(id, **args, &block)
        super(id, **args, &block)

        hide_on :index
      end

      def view_component_namespace
        "Marksmith::MarkdownField"
      end
    end
  end
end
