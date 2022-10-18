# 04 Create a main.rb file that will serve as your console app entry-point.

# 05 Implement startup actions:
def main_menu
  # Present the user with a list of options to perform.
  print 'OOPS Catlog# '
  puts "Please choose an option by entering a number:
	puts '1 - List all books'
	puts '2 - List all music albums'
	puts '3 - List of games'
	puts '4 - List all genres (Comedy or Thriller)'
	puts '5 - List all labels (Gift or New Gift)'
	puts '6 - List all authors'
	puts '7 - List all sources (From a friend or Online shop)'
	puts '8 - Add a book'
	puts '9 - Add a music album'
	puts '10 - Add a game'
	puts '0 - Quit the app"
  print 'OOPS Catlog# '

  # Let users choose an option
  gets.to_i
end

def main(app = App.new)
  input = main_menu
  if input.positive? && input <= 6
    # If needed, ask for parameters for the option.
    app.process(input)
    main(app)
  elsif input == 0
    # Have a way to quit the app.
    print 'OOPS Catlog# '
    puts 'Quitted program'
  else
    print 'OOPS Catlog# '
    puts 'Please enter a valid input'
    main(app)
  end
end

# app started
main
