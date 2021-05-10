class ActivitiesController < ApplicationController
  def index
  end

  def show
    @activity = Activity.find(params[:id])
  end
end
