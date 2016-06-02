class Genre < BaseModel

  def initialize(name)
    super(name)
    @@artists = []
  end

  def self.all
    @@all ||= []
  end

  def add_song(song)
    add(:genre, song)
  end

  def artists
    @@artists
  end

  def add_artist(artist)
    artists << artist unless artists.include?(artist)
  end
end
