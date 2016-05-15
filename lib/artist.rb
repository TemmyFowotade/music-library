require_relative "./concerns/findable"

class Artist
  include Concerns::Initializers
  extend Concerns::ClassMethods

  def songs
    @songs ||= []
  end

  def add_song(song)
    song.artist = self if song.artist.nil?

    songs.push(song) unless song_exists?(songs, song)
  end
end