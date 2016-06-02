require_relative '../concerns/findable.rb'

class BaseModel
  extend Concerns::Findable

  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
  end

  def songs
    @songs ||= []
  end

  def add(model, song)
    songs << song unless songs.include?(song)
    method_name = model.to_s + '='
    song.send(method_name, self) unless song.send(model)
  end

  def save
    self.class.all << self unless self.class.all.include?(self)
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    model = new(name)
    model if model.save
  end
end
