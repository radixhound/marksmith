# frozen_string_literal: true
if defined?(Avo)
  class Marksmith::MarkdownField::EditComponent < Avo::Fields::EditComponent
    def unique_id
      [@field.type, @resource&.singular_route_key, @field.id].compact.join("_")
    end
  end
end
