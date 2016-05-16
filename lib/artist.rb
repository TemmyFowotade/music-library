require_relative "./concerns/modules.rb"

class Artist
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods

  def songs
    @songs ||= []
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist
  end
  
end