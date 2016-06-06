class Song < BaseModel

  attr_reader :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.all
    @@all ||= []
  end

  def artist=(object)
    @artist = object
    @artist.add_song(self)
  end

  def genre=(object)
    @genre = object
    @genre.add_song(self)
    @artist.add_genre(object) if @artist
    @genre.add_artist(artist)
  end

  def to_s
    "#{artist.name} - #{name} - #{genre.name}"
  end
end
