class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :user_id
      t.string :master_record_id
      t.string :master_transcript_id
      t.timestamps
    end
    add_index(:projects, :user_id)
  end
end
