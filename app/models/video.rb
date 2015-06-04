class Video < ActiveRecord::Base
  mount_uploader :source, VideoUploader
  acts_as_taggable
  acts_as_commentable
  paginates_per 12
  belongs_to :user
  validates :title, :kind, presence: true
  validates_numericality_of :kind, less_than_or_equal_to: 2, greater_than: 0
  validates :remote, format: { with: /\A[a-zA-Z0-9_-]+\z/ }, if: ->(video){video.remote.present?}
  validate :wrong_video_source

  def thumb
    if self.source?
      self.source.thumb
    elsif self.remote?
      "http://img.youtube.com/vi/#{self.remote}/0.jpg"
    else
      "http://brzezia.pl/images/znak-zapytania.png"
    end
  end

  private

    def wrong_video_source
      unless source.blank? ^ remote.blank?
        errors.add(:source, "Specify correctly a source of video")
      end
    end
end


