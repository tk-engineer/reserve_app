class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
			t.integer :practice_id
			t.integer :member_id
			t.integer :flag
      t.timestamps
    end
  end
end
