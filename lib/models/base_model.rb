require_relative '../concerns/findable.rb'

class BaseModel
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
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



