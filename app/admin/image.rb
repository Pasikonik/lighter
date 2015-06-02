ActiveAdmin.register Image do
  permit_params :src, :kind
  scope :all, default: true
  scope("Photos") { |scope| scope.where(kind: 1) }
  scope("Graphics") { |scope| scope.where(kind: 2) }

  index do
    selectable_column
    column :id
    column :src do |image|
      image_tag image.src, width: 160
    end
    actions
  end
end
