require_relative "./concerns/findable"

class Song
	include Concerns::Initializers
	extend Concerns::ClassMethods

  attr_reader :artist

  def initialize(name, artist = nil)
    @name = name
    
    unless artist.nil?
      @artist = artist
      @artist.songs.push(self)
    end
  end

  def artist=(name)
    @artist = name

    @artist.add_song(self) unless song_exists?(@artist.songs, self)

    name
  end


end