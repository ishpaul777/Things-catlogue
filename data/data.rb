require 'json'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../classes/game'
require_relative '../classes/author'

class Data
  def initialize
    @books = JSON.parse(File.read('data/books.json'))
    @labels = JSON.parse(File.read('data/labels.json'))
    @albums = JSON.parse(File.read('data/albums.json'))
    @genres = JSON.parse(File.read('data/genres.json'))
    @games = JSON.parse(File.read('data/games.json'))
    @authors = JSON.parse(File.read('data/author.json'))
  end

  def add_label(item)
    print 'OOPS Catlog# '
    print 'Label title: '
    title = gets.chomp

    print 'OOPS Catlog# '
    print 'Label color: '
    color = gets.chomp

    label = Label.new(title, color)
    item.add_label(label)
  end

  def add_book
    print 'OOPS Catlog# '
    print 'Publisher: '
    publisher = gets.chomp

    print 'OOPS Catlog# '
    print 'State of the cover (good or bad): '
    cover_state = gets.chomp

    print 'OOPS Catlog# '
    print 'Publish date: '
    date_published = gets.chomp
    book = Book.new(date_published, publisher, cover_state)

    add_label(book)

    store_book(book)
  end

  def store_book(book)
    label_obj = {
      title: book.label.title,
      color: book.label.color
    }

    book_obj = {
      publisher: book.publisher,
      cover_state: book.cover_state,
      date_published: book.date_published.to_s,
      label: label_obj
    }
    # push it to the book json obj
    @books << book_obj
    @labels << label_obj
    # override
    File.write('data/books.json', JSON.generate(@books))
    File.write('data/labels.json', JSON.generate(@labels))
  end

  def show_books
    puts "\n"
    @books.each_with_index do |book, i|
      print 'OOPS Catlog# '
      puts "#{i + 1} ->"
      puts "Publisher: #{book['publisher']} "
      puts "Date published: #{book['date_published']} "
      puts "Cover state: #{book['cover_state']} "
      puts "Title: #{book['label']['title']}"
      puts "Color: #{book['label']['color']}"
      puts "\n"
    end
  end

  def add_genre(album)
    print 'OOPS Catlog# '
    print 'Genre Name: '
    name = gets.chomp

    genre = Genre.new(name)
    album.add_genre(genre)
  end

  def add_album
    print 'OOPS Catlog# '

    print 'OOPS Catlog# '
    print 'Available on spotify (Y or N): '
    on_spotify = gets.chomp.upcase

    case on_spotify
    when 'Y'
      on_spotify = true
    when 'N'
      on_spotify = false
    else
      puts 'OOPS Library# Please enter a valid input'
      add_album
    end

    print 'OOPS Catlog# '
    print 'Publish date: '
    date_published = gets.chomp
    album = MusicAlbum.new(date_published, on_spotify)

    add_genre(album)
    store_album(album)
  end

  def store_album(album)
    genre_obj = {
      name: album.genre.name
    }

    album_obj = {
      on_spotify: album.on_spotify,
      date_published: album.date_published.to_s,
      genre: genre_obj
    }

    # push it to the book json obj
    @albums << album_obj
    @genres << genre_obj
    # override
    File.write('data/albums.json', JSON.generate(@albums))
    File.write('data/genres.json', JSON.generate(@genres))
  end

  def show_labels
    puts "\n"
    @labels.each_with_index do |label, i|
      print 'OOPS Catlog# '
      puts "#{i + 1} ->"
      puts "Title: #{label['title']}"
      puts "Color: #{label['color']}"
      puts "\n"
    end
  end

  def show_genres
    puts "\n"
    @genres.each_with_index do |genre, i|
      print 'OOPS Catlog# '
      print "#{i + 1}-> "
      puts "Genre: #{genre['name']}"
      puts "\n"
    end
  end

  def show_albums
    puts "\n"
    @albums.each_with_index do |album, i|
      print 'OOPS Catlog# '
      puts "#{i + 1} ->"
      puts "Available on spotify: #{album['on_spotify']}"
      puts "Date Published: #{album['date_published']}"
      puts "Genre: #{album['genre']['name']}"
      puts "\n"
    end
  end

  def add_author(game)
    print 'OOPS Catlog# '
    print 'First Name: '
    first_name = gets.chomp

    print 'OOPS Catlog# '
    print 'Last Name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    game.add_author(author)
  end

  def add_game
    print 'OOPS Catlog# '
    print 'OOPS Catlog# '
    print 'Is the game multiplayer(Y or N): '
    multiplayer = gets.chomp.upcase
    case multiplayer
    when 'Y'
      multiplayer = true
    when 'N'
      multiplayer = false
    else
      puts 'OOPS Library# Please enter a valid input'
      add_game
    end
    print 'OOPS Catlog# '
    print 'Last played at (date): '
    last_played_at = gets.chomp

    print 'OOPS Catlog# '
    print 'Publish date: '
    date_published = gets.chomp
    game = Game.new(multiplayer, last_played_at, date_published)

    add_author(game)
    store_game(game)
  end

  def store_game(game)
    author_obj = {
      first_name: game.author.first_name,
      last_name: game.author.last_name
    }

    game_obj = {
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at,
      date_published: game.date_published.to_s,
      author: author_obj
    }

    # push it to the book json obj
    @games << game_obj
    @authors << author_obj
    # override
    File.write('data/games.json', JSON.generate(@games))
    File.write('data/author.json', JSON.generate(@authors))
  end

  def show_games
    puts "\n"
    @games.each_with_index do |game, i|
      print 'OOPS Catlog# '
      puts "#{i + 1} ->"
      puts "Last played on: #{game['last_played_at']}"
      puts "Date Published: #{game['date_published']}"
      puts "Author Name: #{game['author']['first_name']} #{game['author']['last_name']}"
      puts "\n"
    end
  end

  def show_authors
    puts "\n"
    @authors.each_with_index do |author, i|
      print 'OOPS Catlog# '
      puts "#{i + 1} ->"

      puts "First Name: #{author['first_name']}"
      puts "Last Name: #{author['last_name']}"
      puts "\n"
    end
  end
end
