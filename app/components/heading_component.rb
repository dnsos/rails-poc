# frozen_string_literal: true

class HeadingComponent < ViewComponent::Base
  ALLOWED_TAGS = %i[h1 h2 h3 h4 h5 h6].freeze
  DEFAULT_CLASSES = ''

  def initialize(tag: 'h2', classes: DEFAULT_CLASSES)
    @tag = tag
    @additional_classes = classes
  end
end
