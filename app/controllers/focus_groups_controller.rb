class FocusGroupsController < ApplicationController
  before_action :set_focus_group, only: %i[show]

  def show; end

  private

  def set_focus_group
    @focus_group = FocusGroup.find(params[:id])
  end
end
