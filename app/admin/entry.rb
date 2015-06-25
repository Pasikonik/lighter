ActiveAdmin.register Entry do
  permit_params :title, :body, :thumbnail

  index do
    selectable_column
    column :id
    column :title
    column :body
    actions
  end
end
