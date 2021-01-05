#holds dummy tests 
#rake db:seed loads the seed data from db/seeds.rb

kirk_cousins = Player.create(name: "Kirk Cousins", age: 34, height: "6'2", weight: 175.2, position: "quarterback")

vikings = Team.create(name: "Minnesota Vikings", head_coach_name: "Mike Zimmmer")

contract_1 = Contract.create(player_id: 1, team_id: 1, total_value: 50.5, total_length: 4)


#---------------------------------------1-----------------------------------------------------


adrian_peterson = Player.create(name: "Adrian Peterson", age: 42, height: "5'10", weight: 185.8, position: "running back")

lions = Team.create(name: "Detroit Lions", head_coach_name: "Darrell Bevell")

contract_2 = Contract.create(player_id: 2, team_id: 2, total_value: 17.5, total_length: 2)


#---------------------------------------2------------------------------------------------------


stefon_diggs = Player.create(name: "Stefon Diggs", age: 29, height: "6'1", weight: 186.3, position: "wide reciever")

bills = Team.create(name: "Buffalo Bills", head_coach_name: "Sean McDermott")

contract_3 = Contract.create(player_id: 3, team_id: 3, total_value: 54.3, total_length: 5)


#---------------------------------------3-------------------------------------------------------


justin_jefferson = Player.create(name: "Justin Jefferson", age: 21, height: "6'0", weight: 203.0, position: "wide reciever")

#Team --> Minnesota Vikings ... already created above .... team id of: 1 

contract_4 = Contract.create(player_id: 4, team_id: 1, total_value: 13.2, total_length: 4)


#----------------------------------------4------------------------------------------------------

travis_kelce = Player.create(name: "Travis Kelce", age: 31, height: "6'5", weight: 260.1, position: "tight end")

chiefs = Team.create(name: "Kansas City Chiefs", head_coach_name: "Andy Reid")

contract_5 = Contract.create(player_id: 5, team_id: 4, total_value: 80.0, total_length: 5)

#---------------------------------------5---------------------------------------------------------


roquan_smith = Player.create(name: "Roquan Smith", age: 23, height: "6'0", weight: 230.6, position: "inside linebacker")

bears = Team.create(name: "Chicago Bears", head_coach_name: "Matt Nagy")

contract_6 = Contract.create(player_id: 6, team_id: 5, total_value: 27.0, total_length: 3)