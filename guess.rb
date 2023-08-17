require 'colorize'

@leaderboard = {}

def difficulty()
	puts "Please select the difficulty (Easy, Medium, Hard)".red
	@difficulty = gets.chomp.downcase
	if @difficulty == "easy"
		@cap = 20
	elsif @difficulty == "medium"
		@cap = 50
	else
		@cap = 100
	end
end

def set_default(cap)
	@secret_number = rand(1..@cap)
	#puts @secret_number
	@counter = 1
	@min = 1
	@max = @cap
	@guesses = []
end

def get_name()
	puts "Enter your name to start a new game or type 'X' to exit the game".red
	@player_name = gets.chomp.upcase
end

def guess()
	while @counter <= 6

		puts "Try ##{@counter}. Please guess a number between #{@min}-#{@max}".red
		answer = gets.chomp.to_i

		if answer > @secret_number
			puts "Number is too high".red
			@max = answer 
		elsif answer < @secret_number
			puts "Number is too low".red
			@min = answer
		else
			break puts "Congratulations! Number is correct".green
		end
			
		@guesses << answer
		puts "guesses: #{@guesses}"
		@counter += 1
	end	
	puts "The answer is #{@secret_number}".red
end

def update_leaderboard()
	if @leaderboard[@player_name] == nil
		@leaderboard[@player_name] = @counter
	else
		if @leaderboard[@player_name] > @counter
			@leaderboard[@player_name] = @counter
		end
	end
end

def print_leaderboard()
	puts "HIGHSCORE".blue
	@leaderboard.sort_by(&:last).each do |player, score|
		puts "#{player}: #{score}".blue
	end
end

def restart_game()
	puts "Enter 'Y' to play again".red
	@restart = gets.chomp.downcase
end

def run_game()
	loop do
		get_name()
		break if @player_name == "X"
		puts "Hello #{@player_name}".red
		loop do
			difficulty()
			set_default(@num)
			guess()
			update_leaderboard()	
			print_leaderboard()
			restart_game()
			break if @restart != "y"
		end
	end
	puts "Thank you for playing".red
end

run_game()







