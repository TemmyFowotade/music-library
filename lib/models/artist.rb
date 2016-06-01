class Artist < BaseModel
  @@all ||= []

  def initialize(name)
    super(name)
    @@genres = []
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
