class Video < ActiveRecord::Base
  mount_uploader :source, VideoUploader
  acts_as_taggable
  acts_as_commentable
  paginates_per 12
  belongs_to :user

  def thumb
    if self.source?
      self.source.thumb
    elsif self.remote?
      "http://img.youtube.com/vi/#{self.remote}/0.jpg"
    else
      "http://brzezia.pl/images/znak-zapytania.png"
    end
  end
end
