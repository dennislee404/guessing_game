scoring_card = {}

#restart = "y"
#while restart == "y"
loop do

	puts "Please enter your name"
	player_name = gets.chomp
	puts "Hello #{player_name}"

	secret_number = rand(100)
	puts secret_number

	counter = 1
	min = 1
	max = 100
	guesses = []
	while counter <= 6

		puts "Try ##{counter}. Please guess a number between #{min}-#{max}"
		answer = gets.chomp.to_i

		if answer > secret_number
			puts "Number is too high"
			max = answer
		elsif answer < secret_number
			puts "Number is too low"
			min = answer
		else
			break puts "Congratulations! Number is correct"
		end
			
		guesses << answer
		puts "guesses: #{guesses}"
		counter += 1

	end

	puts "The answer is #{secret_number}"

	puts "HIGHSCORE"
	if scoring_card[player_name] == nil
		scoring_card[player_name] = counter
	else
		if scoring_card[player_name] > counter
			scoring_card[player_name] = counter
		end
	end
	#puts scoring_card
	#puts scoring_card[player_name]
	#scoring_card[player_name] = i
	#puts scoring_card['Dennis']
	scoring_card.sort_by {|player,score| score}.each do |player, score|
	#scoring_card.sort_by(&:last).each do |player, score|
		puts "#{player}: #{score}"
	end

	puts "Enter 'Y' if you wish to play again"
	restart = gets.chomp.downcase
	break if restart != "y"
	
end

puts "Thank you for playing"





