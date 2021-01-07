class CommandLineInterface

      def run
        greet
        puts " "
        user_chooses_team
        view_current_team_contracts
        view_current_team_players
        release_player_from_team
      end
        #choose_crud


        # new_team = Team.first #--> .find_by(user input)
        # new_team.sign_new_player("Stefon Diggs", 3, 50.3)

        # puts new_team.view_all_players_for_team_ever
        # puts new_team.view_all_contracts_for_team_ever


        #run - recursion step


      def greet
        clear_terminal
        puts 'Welcome to the 2020 NFL Contract Report, the best resource for Football contract data.'
        puts " "
        puts 'This application models the ability of an NFL team to manaage its respective player contracts'
      end

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
        when "R" || "RESTART"
          run
        else
            puts "Oops... not a valid choice... please try again"
            pause
            user_chooses_team
        end
      end




      # def choose_crud
      #   puts "Please choose one of the following actions to do by entering the associated number: "
      #   puts "1) Sign a free agent to your Team"
      #   puts "2) View all the player contracts for your Team"
      #   puts "3) View all the players on your Team"
      #   puts "4) Change the terms of the contract for one of your players"
      #   puts "5) Release a player from your Team"
      #   crud_choice = get_user_input
      #   case crud_choice
      #   when "1"
      #       #fill in with method call to create a new contract based on user input
      #   when "2"
      #   when "3"
      #   when "4"
      #   when "5"
          # release_player_from_team
      #   when "Q" || "QUIT"
      #   when "R" || "RESTART"
      #     run
      #   else
      #       puts "Oops... not a valid choice... Please try again"
      #   end
      # end

      # def get_new_contract_terms
      #   puts "Please enter the name of the player you wish to sign"
      #   player_choice = get_user_input
      #   case player_choice
      #    when "1"
      #       #fill in with method call to create a new contract based on user input
      #   when "2"
      #   when "3"
      #   when "4"
      #   when "5"
      #   when "Q" || "QUIT"
      #   when "R" || "RESTART"
      #     run
      #   else
      #       puts "Oops... not a valid choice... Please try again"
      #   end
      #   end

      def view_current_team_contracts
        puts "These are all the contracts for #{@user_team.name}"
        pause
        @user_team.view_all_contracts_for_team_ever
      end

      def view_current_team_players
        current_team_players = @user_team.view_all_player_names
        current_team_players.each_with_index do |name, index|
        puts "These are all the players that play for #{@user_team.name}"
        pause
        puts "#{index+1} #{name}."
        end
      end

      def release_player_from_team
       current_team_players =  @user_team.view_all_player_names
       current_team_players.each_with_index do |name, index|
        puts "#{index+1} #{name}."
        end
        puts "Please enter the name of the player you wish to release."

        user_player_name = get_user_input
        case user_player_name
        when current_team_players.include?(user_player_name)
          @user_team.break_contract(user_player_name)
        when "Q" || "QUIT"
        when "R" || "RESTART"
          run
        else
            puts "Oops... not a valid choice... Please try again"
            pause
            release_player_from_team
        end
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

      #creates a divider between code in terminal
      def divider
        puts "*" * 30
        puts "\n"
        pause
      end


end
