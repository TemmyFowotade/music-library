require_relative "./concerns/modules.rb"

class Song
  extend Concerns::Findable

  attr_reader :artist, :genre
  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist.nil?
    self.genre=(genre) unless genre.nil?
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    object = new(name)
    object.save
    object
  end

  def artist=(name)
    @artist = name
    @artist.add_song(self)
  end

  def genre=(name)
    @genre = name
    @genre.add_song(self)
    @artist.add_genre(name) if @artist
    @genre.add_artist(artist)
  end

end