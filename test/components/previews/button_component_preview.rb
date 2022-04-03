# frozen_string_literal: true

class ButtonComponentPreview < ViewComponent::Preview
  # As Button (default)
  # ----------------
  # Styled as a button, acts as a button.
  #
  # @param content text
  # @param scheme [Symbol] select [primary, secondary, danger, link]
  # @param size [Symbol] select [small, medium]
  # @label As Button (default)
  def as_button(scheme: :secondary, size: :medium, content: 'I am a button')
    render(ButtonComponent.new(tag: :button, path: '', scheme:, size:)) { content }
  end

  # As Link
  # ----------------
  # Styled as a button, acts as a link (<a>).
  #
  # @param content text
  # @param scheme [Symbol] select [primary, secondary, danger, link]
  # @param size [Symbol] select [small, medium]
  # @label As Link
  def as_link(scheme: :secondary, size: :medium, content: 'I am a link button')
    render(ButtonComponent.new(tag: :a, href: '#', scheme:, size:)) { content }
  end
end
