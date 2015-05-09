class Image < ActiveRecord::Base
  mount_uploader :src, ImageUploader
  paginates_per 20
end
