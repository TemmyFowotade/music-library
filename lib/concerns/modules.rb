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
  
end