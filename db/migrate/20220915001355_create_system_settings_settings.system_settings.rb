# This migration comes from system_settings (originally 20181007125347)
class CreateSystemSettingsSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :system_settings_settings do |t|
      t.string :name, null: false, index: true
      t.string :type, null: false, index: true
      t.text :value
      t.text :description
      t.timestamps
    end
  end
end
