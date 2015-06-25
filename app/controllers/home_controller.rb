class HomeController < ApplicationController
  def index
    @videoCounter = Video.all.count
    @imageCounter = Image.all.count
    @tutorialCounter = Tutorial.all.count
  end
end
