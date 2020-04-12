class CreateRotations < ActiveRecord::Migration[6.0]
  def change
    create_table :rotations do |t|
      t.references :device, null: false, foreign_key: true
      t.references :ad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
