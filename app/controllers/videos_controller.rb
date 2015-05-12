class VideosController < ApplicationController
  before_action :set_video, only: [:show, :vote, :add_comment]

  def index
    @videos =  Video.page(params[:page])
    
    allow = ['created_at', 'score', 'views']

    if allow.include?(params[:sort])
      @videos = Video.order("#{params[:sort]}").page(params[:page])
    elsif params[:tag]
      @videos = Video.tagged_with(params[:tag]).page(params[:page])
    end
    
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.remote.sub!(/.*v=/, '') if @video.remote?
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
      params.require(:video).permit(:title, :description, :source, :remote, :rate)
    end

    def reverse(scope)
      @per_page = Video.default_per_page
      puts @per_page.to_s
      total_count = scope.count
      rest_count = total_count > @per_page ? (total_count % @per_page) : 0
      @num_pages = total_count > @per_page ? (total_count / @per_page) : 1

      if params[:page]
        offset = params[:page].sub(/-.*/, '').to_i
        current_page = @num_pages - (offset - 1) / @per_page
        scope.page(current_page).per(@per_page).padding(rest_count)
      else
        scope.page(1).per(@per_page + rest_count)
      end
    end

end