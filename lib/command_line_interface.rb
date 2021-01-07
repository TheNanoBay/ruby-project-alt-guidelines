class CommandLineInterface

      def run
        greet
        puts " "
        user_chooses_team
        pause
        choose_crud
        long_pause 
        run

      end


      def greet
        puts 'Welcome to the 2020 NFL Contract Report, the best resource for Football contract data.'
        puts " "
        puts 'This application models the ability of an NFL team to manaage its respective player contracts'
      end


      #---------User chooses what team they would like to represent---------------------
      def user_chooses_team
        puts "Please choose a team from the list below to manage by entering in the associated number"
        puts "1) Minnesota Vikings"
        puts "2) Detroit Lions"
        puts "3) Buffalo Bills"
        puts "4) Kansas City Chiefs"
        puts "5) Chicago Bears"
        puts "\n ~~ (Q)uit or (R)estart ~~"

        team_choice = get_user_input

        case team_choice
        when "1"
            @user_team = Team.find_by(name: "Minnesota Vikings")   #------> consider refactoring
        when "2"
            @user_team = Team.find_by(name: "Detroit Lions")
        when "3"
            @user_team = Team.find_by(name: "Buffalo Bills")
        when "4"
            @user_team = Team.find_by(name: "Kansas City Chiefs")
        when "5"
            @user_team = Team.find_by(name: "Chicago Bears")
        when "Q" || "QUIT"
            exit_program
        when "R" || "RESTART"
          run
        else
            puts "Oops... not a valid choice... please try again"
            pause
            user_chooses_team
        end
      end

      #---------------user chooses what CRUD feature they would like to work with on the team----------------
      def choose_crud
        clear_terminal
        puts " "
        puts "Please choose one of the following actions to do by entering the associated number: "
        puts "1) Sign a new player to your Team"
        puts "2) View all the player contracts for your Team"
        puts "3) View all the players on your Team"
        puts "4) Change the terms of the contract for one of your players"
        puts "5) Release a player from your Team"
        puts "\n ~~ (Q)uit or (R)estart ~~"


        crud_choice = get_user_input

        case crud_choice
        when "1"
              get_new_contract_terms
        when "2"
              view_current_team_contracts
        when "3"
              view_current_team_players
        when "4"
            change_player_contract_terms
        when "5"
            release_player_from_team
        when "Q" || "QUIT"
            exit_program
        when "R" || "RESTART"
          run
        else
            puts "Oops... not a valid choice... Please try again"
        end
      end

      #----------------Create CRUD feature-------------------------------------------

      def get_new_contract_terms
        all_teams_players = @user_team.view_all_teams_player_names
        
        puts "Please enter the name of the player you wish to sign with the first letter of both the first and last name capitalized"
        puts "\n ~~ (Q)uit or (R)estart ~~"
        player_choice = get_user_input


        if all_teams_players.include?(player_choice)  
            #binding.pry 
            puts "Please enter the total value of the contract: ___ million(s)."
            player_contract_value = get_user_input
            puts "Please enter the total length of the contract: ___ year(s)."
            player_contract_length = get_user_input

            @user_team.break_other_team_contract(player_choice) #breaks the existing contract of a player your are wishing to sign 
            @user_team.sign_new_player(player_choice, player_contract_value, player_contract_length) #call to create new contract based on user input
        else
            case player_choice 
            when "Q" || "QUIT"
                exit_program
            when "R" || "RESTART"
                run
            else
            #binding.pry
            puts "Oops... not a valid player choice... Please try again"
            pause 
            get_new_contract_terms
            end
        end
      end

      #---------------------Read CRUD Features---------------------------------------

      def view_current_team_contracts
        puts "These are all the contracts for #{@user_team.name}:"
        divider
        @user_team.view_all_contracts_for_team_ever
      end


      def view_current_team_players
        current_team_players = @user_team.view_all_current_team_player_names
        puts "These are all the players that play for #{@user_team.name}:"
        divider
        current_team_players.each_with_index do |name, index|
        # puts "These are all the players that play for #{@user_team.name}"
        puts "#{index+1} #{name}."
        end
      end

      #-------------------------Update CRUD feature---------------------------------------------

      def change_player_contract_terms
        current_team_players =  @user_team.view_all_current_team_player_names
         current_team_players.each_with_index do |name, index|
          puts "#{index+1} #{name}."
          end
          puts "Please enter the name of the player who's contract you wish to change."
          puts "\n ~~ (Q)uit or (R)estart ~~"
          player_choice = get_user_input


          if current_team_players.include?(player_choice)
            puts "Please enter the new contract length."
            new_length = get_user_input
            puts "Please enter the new contract value."
            new_value = get_user_input
            @user_team.change_contract_terms(player_choice, new_value, new_length)
          else 
            case player_choice
            when "Q" || "QUIT"
                exit_program
            when "R" || "RESTART"
                run
            else
              puts "Oops... not a valid choice... Please try again"
              pause
              change_player_contract_terms
            end
          end
        end
        #---------------------Delete CRUD feature-------------------------------------------

      def release_player_from_team
       current_team_players =  @user_team.view_all_current_team_player_names
       
       current_team_players.each_with_index do |name, index|
        puts "#{index+1} #{name}."
        end
        puts "Please enter the name of the player you wish to release."
        puts "\n ~~ (Q)uit or (R)estart ~~"

        user_player_name = get_user_input
        case user_player_name
        when current_team_players.include?(user_player_name)
          @user_team.break_contract(user_player_name)
        when "Q" || "QUIT"
            exit_program
        when "R" || "RESTART"
          run
        else
            puts "Oops... not a valid choice... Please try again"
            pause
            release_player_from_team
        end
      end


      #cuts out of program 
      def exit_program
      abort("say goodbye to your computer")
      end

      #gets terminal input from user
      def get_user_input
        gets.chomp
      end

      #clears terminal screen
      def clear_terminal
        system "clear"
      end

      #pauses terminal run time briefly
      def pause
        sleep 1
      end

      #longer terminal pause 
      def long_pause 
        sleep 7
      end 

      #creates a divider between code in terminal
      def divider
        puts "-" * 50
        puts "\n"
        pause
      end
end













# case player_choice  
# when "Stefon Diggs"       #all_teams_players.include?(player_choice) == true
#     binding.pry 
#     puts "Please enter the total value of the contract: ___ million(s)."
#     player_contract_value = get_user_input
#     puts "Please enter the total length of the contract: ___ year(s)."
#     player_contract_length = get_user_input

#     @user_team.break_other_team_contract(player_choice) #breaks the existing contract of a player your are wishing to sign 
#     @user_team.sign_new_player(player_choice, player_contract_value, player_contract_length) #call to create new contract based on user input

# when "Q" || "QUIT"
#     puts "quit"
# when "R" || "RESTART"
#     puts "restart"
#   #run
# when all_teams_players.exclude?(player_choice) 
#     binding.pry
#     puts "Oops... not a valid choice... Please try again"
#     pause 
#     get_new_contract_terms
# end
# end