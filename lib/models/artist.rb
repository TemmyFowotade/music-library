class Artist < BaseModel

  def initialize(name)
    super(name)
    @@genres = []
  end

  def self.all
    @@all ||= []
  end

  def genres
    @@genres
  end

  def add_genre(genre)
    genres << genre unless genres.include?(genre)
  end
end
