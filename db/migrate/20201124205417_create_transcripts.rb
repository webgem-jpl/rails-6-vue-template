class CreateTranscripts < ActiveRecord::Migration[6.0]
  def change
    create_table :transcripts do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :record, null: false, foreign_key: true
      t.text :segments

      t.timestamps
    end
  end
end
