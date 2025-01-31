# frozen_string_literal: true

class Marksmith::MarkdownField::EditComponent < Avo::Fields::EditComponent
  def unique_id
    [@field.type, @resource&.singular_route_key, @field.id].compact.join("_")
  end
end
