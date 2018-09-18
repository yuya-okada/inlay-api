class AddUuidToProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :data
      t.string :name

      t.timestamps
    end
  end
end
