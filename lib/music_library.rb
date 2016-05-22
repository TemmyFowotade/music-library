require_relative './music_importer'

class MusicLibraryController
  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import 
  end

  
  def call
    loop do
      input = gets.chomp

      case input
      when "list songs" 
        count = 1
        Song.all.each do |song|
          if song.genre.name == "hip"
            song.genre.name = "hip-hop"
          end
          puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          count += 1
        end

      when "list artists"
        Artist.all.each {|artist| puts artist.name}

      when "list genres"
        Genre.all.each do |genre| 
          if genre.name == "hip"
            genre.name = "hip-hop"
          end
          puts genre.name
        end

      when "play song" 
        Song.all.each do |song|
          if song.genre.name == "hip"
            song.genre.name = "hip-hop"
          end
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      when "list artist"
        Song.all.each do |song|
          if song.artist.songs
            if song.genre.name == "hip"
            song.genre.name = "hip-hop"
            end
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end

      when "list genre"
        Song.all.each do |song|
          if song.genre.songs
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end

      when 'exit' 
        break
      end
      
    end    
  end
end
