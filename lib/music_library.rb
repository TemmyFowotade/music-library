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
      send(method_name)
    end
  end

  def list_genre 
    Song.all.each do |song|
      if song.genre.songs
        puts "#{song.to_s}"
      end
    end
  end 

  def list_artist 
    Song.all.each do |song|
      if song.artist.songs
        puts "#{song.to_s}"
      end
    end
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
    Genre.all.each do |genre|
      puts genre.name
    end
  end 

  def list_artists 
    Artist.all.each do |artist| 
      puts artist.name 
    end
  end 

  def list_songs 
    Song.all.to_enum.with_index(1).each do |song, count|
      puts "#{count}. #{song.to_s}"
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    self.respond_to?(method_name, include_private) || super 
  end 

  def method_missing(method_name, *args, &block)
    self.to_s 
  end 
end