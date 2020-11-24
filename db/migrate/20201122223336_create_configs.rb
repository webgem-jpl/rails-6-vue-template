class CreateConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :configs do |t|
      t.string :name
      t.json :config

      t.timestamps
    end
    add_index :configs, :name, unique: true
  end
end
