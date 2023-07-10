require_relative 'app'

class Library
  def initialize
    @app = App.new
  end

  def run
    @app.load_data  # Load data from JSON files

    loop do
      puts @app.display_options
      option = gets.chomp.to_i
      @app.handle_options(option)
    end
  end
end

Library.new.run
