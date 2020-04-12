class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.decimal :distance, precision: 8, scale: 2, default: 0
      t.decimal :balance, precision: 16, scale: 8, default: 0

      t.timestamps
    end
  end
end
