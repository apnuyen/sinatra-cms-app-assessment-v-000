class Meals < ActiveRecord::Migration 
	def change 
		create_table :meals do |t| 
			t.date :date 
			t.string :mealtype 
			t.string :item1
			t.string :item2
			t.string :item3 
			t.string :beverages 
			t.integer :user_id 
		end 
	end 
end 