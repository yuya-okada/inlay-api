class RecreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :data
      t.string :uuid
      t.string :name

      t.timestamps
    end
  end
end