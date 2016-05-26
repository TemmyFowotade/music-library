require_relative './music_importer'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    loop do
      puts "Please enter command: "
      input = gets.chomp
      method_name = input.gsub(" ", "_")
      break if input == 'exit'
      self.send(method_name)
    end
  end

  def list_songs 
    Song.all.to_enum.with_index(1).each do |song, count|
      puts "#{count}. #{song.to_s}"
    end
  end

  def list_genre 
    print_model_songs(:genre)
  end 

  def list_artist 
    print_model_songs(:artist)
  end 

  def play_song 
    puts "Please enter song no: "
    song_index = gets.chomp.to_i
    song_to_play = Song.all[song_index - 1]
    if song_to_play     
      puts "Playing #{song_to_play}"
    end
  end 

  def list_genres 
    print_each_name(Genre)
  end 

  def list_artists 
    print_each_name(Artist)
  end 

  def print_model_songs(model)
    Song.all.each do |song|
      if song.send(model).songs
        puts song.to_s
      end
    end
  end

  def print_each_name(model)
    model.all.each do |item|
      puts item.name
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    self.respond_to?(method_name, include_private) || super 
  end 

  def method_missing(method_name, *args, &block)
    self.to_s 
  end 
  
end