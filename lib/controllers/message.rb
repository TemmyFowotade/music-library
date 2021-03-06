require 'colorize'

class Message
  def self.notice(message, color = :yellow)
    puts message.colorize(color)
  end

  def self.command_instructions
    message = <<-msg

    Welcome to Themmy Music Library
    ----------------------------------------------------------------------------
    list songs: To list all songs in the music library
    play song: To play a song
    list artist: To list an artist's songs
    list genre: To list the songs under a specific genre
    list artists: To list all artists whose songs are saved in the music library
    list genres: To list all the genres that the songs belong to
    help: to view command instructions
    else, enter 'exit'
    msg
    puts message.colorize(:green)
  end

  def self.enter_command
    print "Please enter command: ".colorize(:yellow)
  end

  def self.enter_song_number
    print "Please enter song number: ".colorize(:yellow)
  end

  def self.model_info(model)
    print "Please enter #{model.to_s.capitalize}: "
  end

  def self.invalid_song_number
    puts "Invalid song number!\n".colorize(:yellow)
  end

  def self.invalid_command(command)
    puts "Invalid command: #{command}\n"
  end

  def self.playing_song(song)
    puts "Playing #{song}"
  end
end
