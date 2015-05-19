class ImagesController < ApplicationController
  def index
    @images = Image.where(kind: 1).order('created_at DESC').page(params[:page])
    params[:page] ? @page = 1 + params[:page].to_i : @page = 1

    if params[:type]
      @images = Image.where(kind: params[:type]).order('created_at DESC')
    end
  end

  def new
  end

  def create
    @image = Image.create(image_params)    
    render nothing: true
  end

  private

    def image_params
      params.require(:image).permit(:src, :kind)
    end
end
