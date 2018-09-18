class DeleteUuidFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :uuid, :string
  end
end
