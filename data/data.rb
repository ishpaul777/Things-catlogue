require 'json'
require_relative '../classes/book'
require_relative '../classes/label'

class Data
  def initialize
    @books = JSON.parse(File.read('data/books.json'))
    @labels = JSON.parse(File.read('data/labels.json'))
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
    @books.each_with_index do |book, i|
      puts "#{i + 1} ->"
      puts "Publisher: #{book['publisher']} "
      puts "Date published: #{book['date_published']} "
      puts "Cover state: #{book['cover_state']} "
      puts "Title: #{book['label']['title']}"
      puts "Color: #{book['label']['color']}"
      puts "\n"
    end
  end
end
