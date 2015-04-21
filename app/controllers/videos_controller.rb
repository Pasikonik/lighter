class VideosController < ApplicationController
  before_action :set_video, only: [:show]

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to videos_path, notice: 'Video was successfully created'
    else
      redirect_to new_video_path, notice: 'Unfortunately action wasnt done'
    end
  end

  def show
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :description, :source)
    end
end
