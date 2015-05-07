class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
  end

  def create
    @image = Image.create(image_params)
    render nothing: true
  end

  private

    def image_params
      params.require(:image).permit(:src)
    end
end
