class TutorialsController < ApplicationController
  load_and_authorize_resource

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

    def tutorial_params
      params.require(:tutorial).permit(:title, :video, :level)
    end
end
