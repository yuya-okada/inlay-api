class AddUserIdColumnToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :user_id, :string
  end
end
