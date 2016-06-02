class Artist < BaseModel

  def initialize(name)
    super(name)
    #@@all ||= []
    @@genres = []
  end

  def self.all
    @@all ||= []
  end

  def add_song(song)
    add(:artist, song)
  end

  def genres
    @@genres
  end

  def add_genre(genre)
    genres << genre unless genres.include?(genre)
  end
end
