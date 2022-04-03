# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  DEFAULT_SCHEME = :secondary

  SCHEME_MAPPINGS = {
    DEFAULT_SCHEME =>
      'border-lime-600 text-lime-600 transition-colors hover:bg-lime-50',
    :primary =>
      'bg-lime-600 text-white border-transparent transition-colors hover:bg-lime-700',
    :danger =>
      'bg-red-50 border-red-600 text-red-600 transition-colors hover:bg-red-600 hover:text-white',
    :link =>
      'bg-transparent text-neutral-700 border-transparent transition-colors hover:text-lime-600',
  }.freeze
  SCHEME_OPTIONS = SCHEME_MAPPINGS.keys

  DEFAULT_SIZE = :medium
  SIZE_MAPPINGS = {
    :small => 'text-sm py-1 px-2 rounded-sm',
    DEFAULT_SIZE => 'text-base py-2 px-3 rounded-lg',
  }.freeze
  SIZE_OPTIONS = SIZE_MAPPINGS.keys

  def initialize(
    scheme: DEFAULT_SCHEME,
    size: :medium,
    tag: :button,
    href: nil,
    path: nil,
    type: :button,
    **args
  )
    @scheme = scheme
    @tag = tag
    @size = size
    @href = href
    @path = path
    @type = type

    @args = args
    @args[:type] = @type
    @args[:class] =
      class_names(
        @args[:class],
        'border font-medium inline-block h-min',
        SCHEME_MAPPINGS[
          fetch_or_fallback(SCHEME_OPTIONS, @scheme, DEFAULT_SCHEME)
        ],
        SIZE_MAPPINGS[fetch_or_fallback(SIZE_OPTIONS, @size, DEFAULT_SIZE)],
      )
  end

  private

  def fetch_or_fallback(allowed_values, given_value, fallback = nil)
    allowed_values.include?(given_value) ? given_value : fallback
  end
end
