class Tutorial < ActiveRecord::Base
  mount_uploader :video, TutorialUploader
  validates :title, :level, :video, presence: true
  validates_numericality_of :level, less_than_or_equal_to: 5, greater_than: 0

  scope :level, ->(level) { where(level: level) }
end
