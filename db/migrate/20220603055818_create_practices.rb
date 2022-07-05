class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.string :spot
      t.date :date
      t.integer :start
      t.integer :end

      t.timestamps
    end
  end
end
