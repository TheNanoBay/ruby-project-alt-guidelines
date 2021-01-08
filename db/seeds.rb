#holds dummy tests 
#rake db:seed loads the seed data from db/seeds.rb

Player.destroy_all 
Team.destroy_all
Contract.destroy_all

kirk_cousins = Player.create(name: "Kirk Cousins", age: 34, height: "6'2", weight: 175.2, position: "quarterback")

vikings = Team.create(name: "Minnesota Vikings", head_coach_name: "Mike Zimmmer")

contract_1 = Contract.create(player_id: kirk_cousins.id, team_id: vikings.id, total_value: 50.5, total_length: 4)


#---------------------------------------1-----------------------------------------------------


adrian_peterson = Player.create(name: "Adrian Peterson", age: 42, height: "5'10", weight: 185.8, position: "running back")

lions = Team.create(name: "Detroit Lions", head_coach_name: "Darrell Bevell")

contract_2 = Contract.create(player_id: adrian_peterson.id, team_id: lions.id, total_value: 17.5, total_length: 2)


#---------------------------------------2------------------------------------------------------


stefon_diggs = Player.create(name: "Stefon Diggs", age: 29, height: "6'1", weight: 186.3, position: "wide reciever")

bills = Team.create(name: "Buffalo Bills", head_coach_name: "Sean McDermott")

contract_3 = Contract.create(player_id: stefon_diggs.id, team_id: bills.id, total_value: 54.3, total_length: 5)


#---------------------------------------3-------------------------------------------------------


justin_jefferson = Player.create(name: "Justin Jefferson", age: 21, height: "6'0", weight: 203.0, position: "wide reciever")

#Team --> Minnesota Vikings ... already created above .... team id of: 1 

contract_4 = Contract.create(player_id: justin_jefferson.id, team_id: vikings.id, total_value: 13.2, total_length: 4)


#----------------------------------------4------------------------------------------------------

travis_kelce = Player.create(name: "Travis Kelce", age: 31, height: "6'5", weight: 260.1, position: "tight end")

chiefs = Team.create(name: "Kansas City Chiefs", head_coach_name: "Andy Reid")

contract_5 = Contract.create(player_id: travis_kelce.id, team_id: chiefs.id, total_value: 80.0, total_length: 5)

#---------------------------------------5---------------------------------------------------------


roquan_smith = Player.create(name: "Roquan Smith", age: 23, height: "6'0", weight: 230.6, position: "inside linebacker")

bears = Team.create(name: "Chicago Bears", head_coach_name: "Matt Nagy")

contract_6 = Contract.create(player_id: roquan_smith.id, team_id: bears.id, total_value: 27.0, total_length: 3)


#---------------------------------------6--------------------------------------------------------- 


matthew_stafford = Player.create(name: "Matthew Stafford", age: 32, height: "6'3", weight: 220, position: "quarterback")
#Team --> Detroit Lions
contract_7 = Contract.create(player_id: matthew_stafford.id, team_id: lions.id, total_value: 135, total_length: 5)


#---------------------------------------7---------------------------------------------------------


khalil_mac = Player.create(name: "Khalil Mac", age: 29, height: "6'3", weight: 260, position: "outside linebacker")
#Team --> Chicago Bears
contract_8 = Contract.create(player_id: khalil_mac.id, team_id: bears.id, total_value: 141, total_length: 6)


#---------------------------------------8---------------------------------------------------------


patrick_mahomes = Player.create(name: "Patrick Mahomes", age: 25, height: "6'3", weight: 230, position: "quarterback")
#Team --> Kansas City Chiefs
contract_9 = Contract.create(player_id: patrick_mahomes.id, team_id: chiefs.id, total_value: 503, total_length: 10)


#---------------------------------------9---------------------------------------------------------


josh_allan = Player.create(name: "Josh Allan", age: 24, height: "6'5", weight: 237, position: "quarterback")
#Team --> Buffalo Bills
contract_10 = Contract.create(player_id: josh_allan.id, team_id: bills.id, total_value: 21, total_length: 4)


#---------------------------------------10---------------------------------------------------------