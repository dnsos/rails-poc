# frozen_string_literal: true

class ButtonComponentPreview < ViewComponent::Preview
  # As Link
  # ----------------
  # Styled as a button, acts as a link.
  #
  # @param content text
  # @param scheme [Symbol] select [primary, secondary, danger, link]
  # @param size [Symbol] select [small, medium]
  # @label As Link (<a>)
  def as_link(scheme: :secondary, size: :medium, content: 'I am a link button')
    render(ButtonComponent.new(tag: :a, href: '#', scheme:, size:)) { content }
  end
end
