class CreateTeams < ActiveRecord::Migration[5.2]

    def change 
        create_table :teams do |t|
            t.string :name 
            t.string :head_coach_name
        end
    end
end