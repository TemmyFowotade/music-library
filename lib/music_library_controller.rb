require_relative './music_importer'
require 'colorize'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def message(str, color = false)
    if color 
      print str.colorize(:yellow) 
    else 
      print str
    end
  end

  def command_instructions
    "\nWelcome to Themmy Music Library\n\n" +
    "----------------------------------------------------------------------------\n\n" + 
    "list songs: To list all songs in the music library\n" +
    "play song: To play a song using it's serial number\n" +
    "list artist: To list an artist's songs\n" +
    "list genre: To list the songs under a specific genre\n" +
    "list artists: To list all artists whose songs are saved in the music library\n" +
    "list genres: To list all the genres that the songs belong to\n" +  "else, enter 'exit'."
  end

  def call
    loop do
      puts command_instructions.colorize(:green)
      message("Please enter command: ", true)
      input = gets.chomp
      method_name = input.gsub(" ", "_")
      break if input == 'exit'
      send(method_name)
    end
  end

  def list_songs 
    Song.all.to_enum.with_index(1).each { |song, count| puts "#{count}. #{song}" }
  end

  def list_genre
    print_model_songs(:genre)
  end 

  def list_artist
    print_model_songs(:artist)
  end 

  def play_song 
    message("Please enter song no: ", true)
    song_index = gets.chomp.to_i
    song_to_play = Song.all[song_index - 1]
    message("Playing #{song_to_play}") if song_to_play     
  end 

  def list_genres 
    print_each_name(Genre)
  end 

  def list_artists 
    print_each_name(Artist)
  end 

  def print_model_songs(model)
    message("Please enter #{model}: ", true)
    user_input = gets.chomp 
    Song.all.each { |song| puts song.to_s if song.send(model).name == user_input } 
  end

  def print_each_name(model)
    model.all.each { |item| puts item.name }
  end

  def respond_to_missing?(method_name, include_private = false)
    respond_to?(method_name, include_private) || super 
  end 

  def method_missing(method_name, *args)
    message("Invalid command: #{method_name}\n")
  end 
  
end