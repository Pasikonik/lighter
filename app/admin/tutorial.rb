ActiveAdmin.register Tutorial do
  permit_params :title, :level, :video

  index do
    selectable_column
    column :id
    column :level
    column :title
    actions
  end
end
