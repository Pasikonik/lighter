class VideosController < ApplicationController
  before_action :set_video, except: [:index, :new, :create]

  def index 
    allow = ['created_at', 'score', 'views']

    @videos = Video.all
    
    @videos = @videos.where(kind: params[:type]) if params[:type]
    @videos = @videos.tagged_with(params[:tag]) if params[:tag]
    @videos = @videos.order("#{params[:sort]} DESC") if allow.include?(params[:sort])
    @videos = @videos.where("title LIKE ?", "%#{params[:search]}%") if params[:search]
    @videos = @videos.page(params[:page])

    @params = params.slice(:type, :sort, :tag) # prevent XSS attack
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.remote.sub!(/.*watch\?v=/, '') if @video.remote?
    @video.user = current_user
    @video.tag_list = params[:tag_list]
    if @video.save
      redirect_to video_path(@video), notice: 'Video was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update(video_params)
      @video.tag_list = params[:tag_list]
      @video.save
      redirect_to video_path(@video)
    else
      redirect_to edit_video_path(@video)
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path
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

  def tags
    render json: @video.tag_list.to_json
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
      params.require(:video).permit(:title, :description, :source, :remote, :kind, :rate)
    end
end