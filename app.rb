# app.rb
require_relative 'book'
require_relative 'music_album'
require_relative 'game'
require_relative 'game_author'
require_relative 'item'
require_relative 'label'
require 'json'
class App
  attr_accessor :books, :music_albums, :games, :labels, :genres, :game_authors

  def initialize
    load_data
    @labels = []
  end

  def load_data
    @books = load_items_from_file('books.json', Book)
    @music_albums = load_items_from_file('music_albums.json', MusicAlbum)
    @games = load_items_from_file('games.json', Game)
    @genres = load_items_from_file('genres.json', Genre)
    @game_authors = load_items_from_file('game_authors.json', GameAuthor)
    load_labels
  end

  def load_labels
    @labels = load_items_from_file('labels.json', Label)
  end

  def save_data
    save_items_to_file('books.json', @books)
    save_items_to_file('music_albums.json', @music_albums)
    save_items_to_file('games.json', @games)
    save_items_to_file('genres.json', @genres)
    save_items_to_file('game_authors.json', @game_authors)
    save_items_to_file('labels.json', @labels)
  end

  def load_items_from_file(file_name, item_class)
    if File.exist?(file_name)
      json_data = File.read(file_name)
      if json_data.empty?
        items = []
      else
        items = JSON.parse(json_data).map { |item_data| item_class.new_from_hash(item_data) }
      end
    else
      items = []
    end
    items
  rescue JSON::ParserError => e
    puts "Error loading data from #{file_name}: #{e.message}"
    items = []
  end

  def save_items_to_file(file_name, items)
    json_data = JSON.generate(items.map(&:to_hash))
    File.write(file_name, json_data)
  end

  def add_book
    puts 'Enter published date:'
    published_date = gets.chomp
    puts 'Enter title:'
    title = gets.chomp
    puts 'Enter author:'
    author = gets.chomp
    puts 'Enter cover state:'
    cover_state = gets.chomp
    puts 'Enter genre:'
    genre = gets.chomp
    @books << Book.new(published_date, title, author, cover_state, genre)

    save_items_to_file('books.json', @books)

    puts 'Book added.'
  end

  def add_label
    puts 'Enter label name:'
    label_name = gets.chomp
    label = Label.new(label_name)
    @labels << label
    save_items_to_file('labels.json', @labels)

    puts 'Label added.'
  end

  def add_music_album
    puts 'Enter music album name:'
    name = gets.chomp
    puts 'Enter published date:'
    published_date = gets.chomp
    puts 'Enter genre:'
    genre = gets.chomp
    puts 'On Spotify? (yes/no):'
    on_spotify = gets.chomp.downcase
    on_spotify = (on_spotify == 'yes')
    @music_albums << MusicAlbum.new(published_date, name, genre, on_spotify)

    save_items_to_file('music_albums.json', @music_albums)

    puts 'Music album added.'
  end

  def add_game
    puts 'Enter published date:'
    published_date = gets.chomp
    puts 'Single player? (yes/no):'
    single_player = gets.chomp.downcase
    single_player = (single_player == 'yes')
    puts 'Enter last played date:'
    last_played_at = gets.chomp
    @games << Game.new(single_player, last_played_at, published_date)

    save_items_to_file('games.json', @games)

    puts 'Game added.'
  end

  def add_game_author
    puts 'Enter first name:'
    first_name = gets.chomp
    puts 'Enter last name:'
    last_name = gets.chomp
    @game_authors << GameAuthor.new(first_name, last_name)

    save_items_to_file('game_authors.json', @game_authors)

    puts 'Game author added.'
  end

  def add_genre
    puts 'Enter genre:'
    genre = gets.chomp
    @genres << Genre.new(genre)

    save_items_to_file('genres.json', @genres)

    puts 'Genre added.'
  end

  def display_books
    if @books.empty?
      puts 'No books found.'
    else
      puts 'List of books:'
      @books.each do |book|
        puts "Published date: #{book.published_date}"
        puts "Title: #{book.title}"
        puts "Author: #{book.author}"
        puts "Cover state: #{book.cover_state}"
        puts '-' * 30
      end
    end
    puts 'Books displayed.'
  end

  def display_music_albums
    if @music_albums.empty?
      puts 'No music albums found.'
    else
      puts 'List of music albums:'
      @music_albums.each do |album|
        puts "Name: #{album.name}"
        puts "On Spotify: #{album.on_spotify ? 'Yes' : 'No'}"
        puts '-' * 30
      end
    end
    puts 'Music albums displayed.'
  end

  def display_genres
    if @genres.empty?
      puts 'No genres found.'
    else
      puts 'List of genres:'
      @genres.each do |genre|
        puts "Genre: #{genre.name}"
      end
    end
    puts 'Genres displayed.'
  end

  def display_games
    if @games.empty?
      puts 'No games found.'
    else
      puts 'List of games:'
      @games.each do |game|
        puts "Published date: #{game.published_date}"
        puts "Single player: #{game.single_player ? 'Yes' : 'No'}"
        puts "Last played at: #{game.last_played_at}"
        puts '-' * 30
      end
    end
    puts 'Games displayed.'
  end

  def display_game_authors
    if @game_authors.empty?
      puts 'No game authors found.'
    else
      puts 'List of game authors:'
      @game_authors.each do |game_author|
        puts "First name: #{game_author.first_name}"
        puts "Last name: #{game_author.last_name}"
      end
    end
    puts 'Game authors displayed.'
  end

  def display_labels
    if @labels.empty?
      puts 'No labels found.'
    else
      puts 'List of labels:'
      @labels.each do |label|
        puts "Title: #{label.title}"
        puts '-' * 30
      end
    end
    puts 'Labels displayed.'
  end
end
