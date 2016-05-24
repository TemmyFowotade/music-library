require_relative './concerns/modules.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@genres = []
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
    song.artist = self unless song.artist
  end

  def genres
    @@genres
  end

  def add_genre(genre)
    genres << genre unless genres.include?(genre)
  end
end
