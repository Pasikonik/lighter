class Image < ActiveRecord::Base
  mount_uploader :src, ImageUploader
  paginates_per 20
  validates :src, :kind, presence: true
  validates_numericality_of :kind, less_than_or_equal_to: 2, greater_than: 0
end
