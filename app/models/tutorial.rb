class Tutorial < ActiveRecord::Base
  mount_uploader :video, TutorialUploader
end
