class TutorialsController < ApplicationController
  load_and_authorize_resource
  before_action :accordian_data, only: [:index, :show]

  def index
  end

  def new
    @tutorial = Tutorial.new
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    if @tutorial.save
      redirect_to tutorials_path, notice: 'Tutorial was succesfully created'
    else
      redirect_to new_tutorial_path, notice: 'Unfortunately action failed'
    end
  end

  private

    def accordian_data
      @tutorialOne = Tutorial.where(level: 1)
      @tutorialTwo = Tutorial.where(level: 2)
      @tutorialThree = Tutorial.where(level: 3)
      @tutorialFour = Tutorial.where(level: 4)
      @tutorialFive = Tutorial.where(level: 5)
    end

    def tutorial_params
      params.require(:tutorial).permit(:title, :video, :level)
    end
end
