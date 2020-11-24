class CreateTranscripts < ActiveRecord::Migration[6.0]
  def change
    create_table :transcripts do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :record, null: false, foreign_key: true
      t.belongs_to :config, null: false, foreign_key: true
      t.string :url
      t.json :editable, default: {}, null: false
      t.json :segments, default: {}, null: false
      t.json :metrics, default: {}, null: false

      t.timestamps
    end
  end
end
