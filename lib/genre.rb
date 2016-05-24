require_relative './concerns/modules.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@artists = []
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
