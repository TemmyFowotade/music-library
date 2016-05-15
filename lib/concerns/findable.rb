module Concerns

	module Initializers
		attr_accessor :name
		@@all = []
		
		def initialize(name)
	    @name = name
	  end

	  def save
			@@all.push(self)
		end

    private

    def song_exists?(songs, song)
      exists = false

      songs.each do |obj|
        if (obj.class == Song) && obj.name == song.name && obj.artist
          exists = true
          break
        end
      end

      exists
    end
	end

	module ClassMethods

		def all
	    Initializers.class_variable_get("@@all")
	 	end

		def destroy_all
			Initializers.class_variable_set("@@all", [])
		end
 
		def create(name)
			generic_object = new(name)
			generic_object.save
			generic_object
		end
	end

	module Findable  
	end

end