# frozen_string_literal: true

class HeadingComponentPreview < ViewComponent::Preview
  # @!group All
  def h1
    render(HeadingComponent.new(tag: :h1)) { 'I am a h1' }
  end

  def h2
    render(HeadingComponent.new(tag: :h2)) { 'I am a h2' }
  end

  def h3
    render(HeadingComponent.new(tag: :h3)) { 'I am a h3' }
  end

  def h4
    render(HeadingComponent.new(tag: :h4)) { 'I am a h4' }
  end

  def h5
    render(HeadingComponent.new(tag: :h5)) { 'I am a h5' }
  end

  def h6
    render(HeadingComponent.new(tag: :h6)) { 'I am a h6' }
  end

  # @!endgroup

  # Heading level 1
  # ----------------
  # Note that adding `classes` in Lookbook will not work because of the way Tailwind generates classes.
  #
  # @param content text
  # @param classes text
  # @label Level 1
  def as_h1(content: 'I am a h1', classes: '')
    render(HeadingComponent.new(tag: :h1, classes:)) { content }
  end

  # Heading level 2
  # ----------------
  # Note that adding `classes` in Lookbook will not work because of the way Tailwind generates classes.
  #
  # @param content text
  # @param classes text
  # @label Level 2
  def as_h2(content: 'I am a h2', classes: '')
    render(HeadingComponent.new(tag: :h2, classes:)) { content }
  end

  # Heading level 3
  # ----------------
  # Note that adding `classes` in Lookbook will not work because of the way Tailwind generates classes.
  #
  # @param content text
  # @param classes text
  # @label Level 3
  def as_h3(content: 'I am a h3', classes: '')
    render(HeadingComponent.new(tag: :h3, classes:)) { content }
  end

  # Heading level 4
  # ----------------
  # Note that adding `classes` in Lookbook will not work because of the way Tailwind generates classes.
  #
  # @param content text
  # @param classes text
  # @label Level 4
  def as_h4(content: 'I am a h4', classes: '')
    render(HeadingComponent.new(tag: :h4, classes:)) { content }
  end

  # Heading level 5
  # ----------------
  # Note that adding `classes` in Lookbook will not work because of the way Tailwind generates classes.
  #
  # @param content text
  # @param classes text
  # @label Level 5
  def as_h5(content: 'I am a h5', classes: '')
    render(HeadingComponent.new(tag: :h5, classes:)) { content }
  end

  # Heading level 6
  # ----------------
  # Note that adding `classes` in Lookbook will not work because of the way Tailwind generates classes.
  #
  # @param content text
  # @param classes text
  # @label Level 6
  def as_h6(content: 'I am a h6', classes: '')
    render(HeadingComponent.new(tag: :h6, classes:)) { content }
  end
end
