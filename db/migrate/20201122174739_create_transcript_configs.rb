<<<<<<< HEAD
=======
# frozen_string_literal: true

>>>>>>> cf5e129... scaffold: TranscriptionOption
class CreateTranscriptConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :transcript_configs do |t|
      t.string :name
      t.text :config

      t.timestamps
    end
    add_index :transcript_configs, :name, unique: true
  end
end
