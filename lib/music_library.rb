require_relative './music_importer'

class MusicLibraryController
  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import 
  end

  def call
    loop do
      puts "Welcome to Themmy's Music Library"
      puts "else, enter exit"
      print "Enter your choice: "
      input = gets.chomp.downcase

      case input
      when 'exit' 
        break
      end
    end    
  end
end
