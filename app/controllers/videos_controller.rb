class VideosController < ApplicationController
  before_action :set_video, only: [:show, :vote, :add_comment]

  def index
    @videos = Video.all
    
    if params[:date]
      if params[:date] == "up"
        @videos = Video.all
      elsif params[:date] == "down"
        @videos = Video.all.reverse
      end
    elsif params[:views]
      if params[:views] == "up"
        @videos = Video.order(:views)
      elsif params[:views] == "down"
        @videos = Video.order(:views).reverse
      end
    elsif params[:rate]
      if params[:rate] == "up"
        @videos = Video.order(:score)
      elsif params[:rate] == "down"
        @videos = Video.order(:score).reverse
      end
    elsif params[:tag]
      @videos = Video.tagged_with(params[:tag])
    end    
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    @video.tag_list = params[:tag_list]
    if @video.save
      redirect_to videos_path, notice: 'Video was successfully created'
    else
      redirect_to new_video_path, notice: 'Unfortunately action wasnt done'
    end
  end

  def show
    @video.increment!(:views)
    if Rating.exists?(user: current_user, video: @video)
      @rate = Rating.find_by(user: current_user, video: @video).score
    else
      @rate = 0
    end
    @comments = @video.comments
    @comment = Comment.new
  end

  def vote
    rate = Rating.find_or_initialize_by(user: current_user, 
                                        video: @video)
    rate.update(score: video_params[:rate])

    avg_score = Rating.where(video: @video).average(:score)
    @video.update(score: avg_score)
    render nothing: true
  end

  def add_comment
    @video.comments.create(comment: params[:comment][:comment], user: current_user)
    render nothing: true
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :description, :source, :rate)
    end

end
