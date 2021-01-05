class Team < ActiveRecord::Base
    has_many :contracts
    has_many :players, through: :contracts


    #create feature - As a user, I want to sign a player via a contract
    def sign_new_player(player_name, length_of_contract, value_of_contract)
       signing_player = Player.find_by(name: player_name)
       new_contract = Contract.create(player_id: signing_player.id, team_id: self.id, total_value: value_of_contract, total_length: length_of_contract)

       puts "It's signed! #{signing_player.name} now plays for #{self.name}."
       puts " "
       new_contract 
    end

    #read feature - As a user, I want to view all the contracts that were ever signed over time - and their details (Read) 


    #read feature - As a user, I want to be able to browse all the current players & all the players signed to a team (Read) 


    # Edit feature - As a user, I want to change the terms of a contract (Edit) 


    # Delete feature - As a user, I want to delete a contract with a player.. fire them (delete)

    


end