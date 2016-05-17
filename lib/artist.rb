require_relative "./concerns/modules.rb"

class Artist
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  def initialize(name)
    super
    @@genres = []
  end


  def songs
    @songs ||= []
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    @@genres
  end

  def add_genre(genre)
    genres << genre unless genres.include?(genre)
  end
  
end