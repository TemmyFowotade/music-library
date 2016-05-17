module Concerns

  module InstanceMethods

    attr_accessor :name
    @@all = []

    def initialize(name)
      @name = name
    end

    def save
      @@all << self
    end

  end


  module ClassMethods

    def all
      InstanceMethods.class_variable_get("@@all")
    end

    def destroy_all
      InstanceMethods.class_variable_set("@@all", [])
    end

    def create(name)
      object = new(name)
      object.save
      object
    end

  end

  module Findable

    def find_by_name(name)
      objects = self.all
      objects.each do |obj|
        if obj.name == name
          return obj
        end
      end
    end

    def find_or_create_by_name(name)
      objects = self.all
      objects.each do |obj|
        if obj.name == name
          return obj
        else
          obj = new(obj)
          obj.create(obj)
        end
      end
    end

  end
  
end