class ImagesController < ApplicationController
  def index
    @images = Image.page(params[:page])
    params[:page] ? @page = 1 + params[:page].to_i : @page = 1
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
