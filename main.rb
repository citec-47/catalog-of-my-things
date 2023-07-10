require_relative 'app'
require_relative 'book'
require_relative 'music_album'
require_relative 'game'
require_relative 'game_author'
require_relative 'genre'

class Main
  OPTIONS = {
    1 => :display_books,
    2 => :display_music_albums,
    3 => :display_genres,
    4 => :display_games,
    5 => :add_book,
    6 => :add_music_album,
    7 => :add_genre,
    8 => :add_game,
    9 => :add_game_author,
    10 => :display_game_authors,
    12 => :display_labels,
    13 => :add_label,
    11 => :exit
  }.freeze

  def initialize(app)
    @app = app
  end

  def display_options
    <<~OPTIONS
      Welcome to the App!
      1 - Display all books
      2 - Display all music albums
      3 - Display genres
      4 - Display all games
      5 - Add book
      6 - Add music album
      7 - Add genre
      8 - Add game
      9 - Add game author
      10 - Display game authors
      12 - Display all labels
      13 - Add label
      11 - Exit
    OPTIONS
  end

  def handle_options(option)
    if OPTIONS.key?(option)
      selected_option = OPTIONS[option]
      return exit if selected_option == :exit

      @app.send(selected_option)
    else
      puts 'Invalid option'
    end
  end

  private

  def exit
    puts 'Exiting...'
    Kernel.exit
  end
end

app = App.new
app.load_data  # Load data from JSON files

menu = Main.new(app)

loop do
  puts menu.display_options
  option = gets.chomp.to_i
  menu.handle_options(option)
end
