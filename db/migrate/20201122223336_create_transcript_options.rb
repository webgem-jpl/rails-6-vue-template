class CreateTranscriptOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :transcript_options do |t|
      t.string :name
      t.text :config

      t.timestamps
    end
    add_index :transcript_options, :name, unique: true
  end
end
