class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :name
      t.references :transcript_option, null: false, foreign_key: true
      t.references :project, null: true, foreign_key: true
      t.integer :pointers, array: true, default: []
      t.string :url
      t.text :segments
      t.string :transcript_id

      t.timestamps
    end
  end
end
