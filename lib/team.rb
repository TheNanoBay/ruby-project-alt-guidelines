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
    def view_all_contracts_for_team_ever 
        self.contracts.map do |contract|
            player_name = Player.find(contract.player_id).name
            "#{player_name} signed with #{self.name} for #{contract.total_length} years and it's worth #{contract.total_value} million dollars."
        end
    end

    #read feature - As a user, I want to be able to browse all the current players & all the players signed to a team (Read) 
    def view_all_players_for_team_ever 
        self.players.map do |player|
            "#{player.name} played for the #{self.name} and had the following stats -> Position: #{player.position} Height: #{player.height} Weight: #{player.weight}"
        end 
    end

    # Edit feature - As a user, I want to change the terms of a contract (Edit) 
    def change_contract
        
    end

    # Delete feature - As a user, I want to delete a contract with a player.. fire them (delete)
    def break_contract(player_name) 
        changing_player_id = Player.find_by(name: player_name).id
        deleted_contract = self.contracts.find(changing_player_id)
        deleted_contract.destroy
    end
    


end