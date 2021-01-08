class CommandLineInterface

      def run
        clear_terminal
        greet #1
        puts " "
        user_chooses_team  #2
        pause
        choose_crud   #3
        long_pause  #4
        run

      end


      def greet
        render_ascii_art
        puts 'Welcome to the 2020 NFL Contract Report, the best resource for Football contract data.'
        puts " "
        puts 'This application models the ability of an NFL team to manaage its respective player contracts.'
        puts " "
      end


      #---------User chooses what team they would like to represent---------------------
      def user_chooses_team

        prompt = TTY::Prompt.new
        team_choice = prompt.select("Please choose a team from the list below to manage:") do |menu|
          menu.choice "Minnesota Vikings"
          menu.choice "Detroit Lions"
          menu.choice "Buffalo Bills"
          menu.choice "Kansas City Chiefs"
          menu.choice "Chicago Bears"
          menu.choice "QUIT"
          menu.choice "RESTART"
        end

        case team_choice
        when "Minnesota Vikings"
            @user_team = Team.find_by(name: "Minnesota Vikings")   #------> consider refactoring
        when "Detroit Lions"
            @user_team = Team.find_by(name: "Detroit Lions")
        when "Buffalo Bills"
            @user_team = Team.find_by(name: "Buffalo Bills")
        when "Kansas City Chiefs"
            @user_team = Team.find_by(name: "Kansas City Chiefs")
        when "Chicago Bears"
            @user_team = Team.find_by(name: "Chicago Bears")
        when "QUIT"
            exit_program
        when "RESTART"
          run
        else
            oops
            pause
            user_chooses_team
        end
      end

      #---------------user chooses what CRUD feature they would like to work with on the team----------------
      def choose_crud
        clear_terminal

        prompt = TTY::Prompt.new
        crud_choice = prompt.select("Please choose one of the following actions to do:") do |menu|
            menu.choice "Sign a new player to your Team"
            menu.choice "View all the player contracts for your Team"
            menu.choice "View all the players on your Team"
            menu.choice "Change the terms of the contract for one of your players"
            menu.choice "Release a player from your Team"
            menu.choice "QUIT"
            menu.choice "RESTART"
        end


        case crud_choice
        when "Sign a new player to your Team"
              get_new_contract_terms
        when "View all the player contracts for your Team"
              view_current_team_contracts
        when "View all the players on your Team"
              view_current_team_players
        when "Change the terms of the contract for one of your players"
            change_player_contract_terms
        when "Release a player from your Team"
            release_player_from_team
        when "QUIT"
            exit_program
        when "RESTART"
          run
        else
            oops
            choose_crud
        end
      end

      #----------------Create CRUD feature-------------------------------------------

      def get_new_contract_terms
        all_teams_players = @user_team.view_all_teams_player_names
        
        puts "Please enter the name of the player you wish to sign with the first letter of both the first and last name capitalized"
        puts "\n ~~ (Q)uit or (R)estart ~~"
        player_choice = get_user_input


        if all_teams_players.include?(player_choice)   
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
            oops
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
              oops
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

           if current_team_players.include?(user_player_name)
             @user_team.break_contract(user_player_name)
          else
              case user_player_name
              when "Q" || "QUIT"
                  exit_program
              when "R" || "RESTART"
                  run
              else
              oops
              pause
              release_player_from_team
              end
            end
         end


      #cuts out of program 
      def exit_program
      abort("----- Thank you --- GoodBye ----")
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
        sleep 2
      end 

      #creates a divider between code in terminal
      def divider
        puts "-" * 50
        puts "\n"
        pause
      end

      def render_ascii_art
        read_file = File.read("lib/football_art.txt") 
        puts read_file
      end

      def oops
        puts "Oops... not a valid player choice... Please try again"
        `say Oops that is not a valid choice`
      end

end

