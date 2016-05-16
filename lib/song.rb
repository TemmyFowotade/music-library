require_relative "./concerns/modules.rb"

class Song
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods

  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist.nil?
    self.genre=(genre) unless genre.nil?
  end

  def artist=(name)
    @artist = name
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless genre.songs.include?(self)
  end

a
end