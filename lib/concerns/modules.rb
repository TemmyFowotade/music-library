module Concerns

  module InstanceMethods

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def save
      unless self.class.all.include?(self)
        self.class.all << self 
      end
    end
  end


  module ClassMethods

    def all
      self.class_variable_get("@@all")
    end

    def destroy_all
      self.class_variable_set("@@all", [])
    end

    def create(name)
      object = self.new(name)
      object.save
      object
    end
  end

  module Findable

    def find_by_name(name)
      all.find { |object| object.name == name }
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end

    def new_from_filename(name)
      path_array = name.gsub('.mp3', '').split(' - ')
      artist = Artist.find_or_create_by_name(path_array[0])
      genre = Genre.find_or_create_by_name(path_array[2])
      song = Song.new(path_array[1], artist, genre)
      song
    end

    def create_from_filename(name)
      obj = new_from_filename(name)
      obj.save
      obj
    end
  end
  
end