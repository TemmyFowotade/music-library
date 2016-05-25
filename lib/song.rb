require_relative './concerns/modules.rb'

class Song
  attr_reader :artist, :genre
  attr_accessor :name

  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
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

  def to_s
    "#{artist.name} - #{name} - #{genre.name}"
  end
end
