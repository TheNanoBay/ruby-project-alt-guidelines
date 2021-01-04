class CreateContracts < ActiveRecord::Migration[5.2]

    def change 
        create_table :contracts do |t|
            t.integer :player_id
            t.integer :team_id
            t.float :total_value
            t.integer :total_length
        end
    end
end