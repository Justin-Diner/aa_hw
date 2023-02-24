class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
			t.string :name, null: false, index: true
			t.string :toyable_type, null: false
			t.references :toyable, null: false, polymorphic: true, null: false 
      t.timestamps
    end

		add_index :toys, [:name, :toyable_type, :toyable_id], unique: true 
		add_index :toys, [:toyable_type, :toyable_id], unique: true
  end
end
