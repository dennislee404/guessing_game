restart = "Y"
while restart == "Y"

	secret_number = rand(100)
	#puts secret_number

	i = 1
	guesses = []
	while i <= 6

		puts "Try ##{i}"
		answer = gets.chomp.to_i


		if answer > secret_number
			puts "Number is too high"
		elsif answer < secret_number
			puts "Number is too low"
		else
			break puts "Congratulations! Number is correct"
		end
			
		guesses << answer
		puts "guesses: #{guesses}"
		i += 1

	end

	puts "No more tries. The answer is #{secret_number}"

	puts "Enter 'Y' if you wish to play again"
	restart = gets.chomp
	
end

puts "Thanks for playing"





