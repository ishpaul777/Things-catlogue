require_relative './data/data'
class App
  def initialize(data = Data.new)
    @data = data
  end

  def process(input)
    case input
    when 1
      # 1 list books
      @data.show_books

    when 2
      # '2 - List all music albums'
      @data.show_albums

      # when 3
      # 	# '3 - List of games'

    when 4
      #	# '4 - List all genres (Comedy or Thriller)'
      @data.show_genres

    when 5
      # '5 - List all labels (Gift or New Gift)'
      @data.show_labels

    # when 6
    # 	# '6 - List all authors'

    # when 7
    # 	# '7 - List all sources (From a friend or Online shop)'

    when 8
      # '8 - Add a book'
      @data.add_book

    when 9
      # '9 - Add a music album'
      @data.add_album
    end

    # when 10
    # 	# '10 - Add a game'
    # end
  end
end
