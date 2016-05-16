require_relative "./concerns/modules.rb"

class Genre
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods

  def songs
    @songs ||= []
  end


  
end