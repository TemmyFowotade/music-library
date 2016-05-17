require_relative "./concerns/modules.rb"

class Genre
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  def initialize(name)
    super
    @@artists = []
  end

  def songs
    @songs ||= []
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.genre = self unless song.genre
  end

  def artists
    @@artists
  end

  def add_artist(artist)
    artists << artist unless artists.include?(artist)
  end
  
end