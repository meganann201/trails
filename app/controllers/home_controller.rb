class HomeController < ApplicationController

  def index
    @parks = Park.all.sample(6)
    @popular_trails = Activity.hikes.sample(4)
    @pet_friendly = Activity.hikes.pet_friendly.sample(4)
  end

end
