require_relative './data/data'
class App
  def initialize(data = Data.new)
    @data = data
  end

  def process(input)
    case input
    # when 1
    # 	#1 list books
    # end

    # when 2
    # 	# '2 - List all music albums'
    # end

    # when 3
    # 	# '3 - List of games'
    # end

    # when 4
    # 	# '4 - List all genres (Comedy or Thriller)'
    # end

    # when 5
    # 	# '5 - List all labels (Gift or New Gift)'
    # end

    # when 6
    # 	# '6 - List all authors'
    # end

    # when 7
    # 	# '7 - List all sources (From a friend or Online shop)'
    # end

    when 8
      # '8 - Add a book'
      @data.add_book
    end

    # when 9
    # 	# '9 - Add a music album'
    # end

    # when 10
    # 	# '10 - Add a game'
    # end
  end
end
