class ChangeColumnNameInVideo < ActiveRecord::Migration
  def change
    rename_column :videos, :type, :kind
    rename_column :images, :type, :kind
  end
end
