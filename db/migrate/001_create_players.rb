class CreatePlayers < ActiveRecord::Migration[5.2]

    def change 
        create_table :players do |t|
            t.string :name 
            t.integer :age
            t.string :height
            t.float :weight
            t.string :position
        end
    end
end