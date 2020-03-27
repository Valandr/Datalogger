class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :identifier
      t.datetime :datetime
      t.float :energy
      t.references :onduleur, foreign_key: true

      t.timestamps
    end
  end
end
