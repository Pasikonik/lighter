ActiveAdmin.register Video do
  permit_params :title, :description, :kind, :score, :source, :remote
  scope :all, default: true
  scope("Trick") { |scope| scope.where(kind: 1) }
  scope("Presentation") { |scope| scope.where(kind: 2) }
  scope("Rated") { |scope| scope.where("score > 0") }

  index do
    selectable_column
    column :id
    column :title
    column "image", :src do |video|
      image_tag video.thumb, width: 192
    end
    column :kind do |video|
      if video.kind == 1 
        "Trick"
      elsif video.kind == 2
        "Presentation"
      else
        "unknow"
      end 
    end
    column :score
    column :views
    actions
  end

end
