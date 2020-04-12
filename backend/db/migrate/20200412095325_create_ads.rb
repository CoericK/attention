class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.string :url
      t.decimal :cpm, precision: 16, scale: 8, default: 0

      t.timestamps
    end
  end
end
