class Video < ActiveRecord::Base
  ratyrate_rateable 'score'
  mount_uploader :source, VideoUploader
  belongs_to :user
end
