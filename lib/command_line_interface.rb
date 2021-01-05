class CommandLineInterface 

    def greet
        puts 'Welcome to Handegg Report, the best resource for Football contract data '
      end


      #def get_option_from_user
        #puts "What would you like to do first?"
      #end 

      def run
        greet 
        new_team = Team.first #--> .find_by(user input)
        new_team.sign_new_player("Stefon Diggs", 3, 50.3)
        #run - recursion step
      end


      #clears terminal screen 
      def clear_screen
        system "clear"
      end



end