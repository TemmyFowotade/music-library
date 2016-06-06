module Concerns
  module Findable

    def find_by_name(name)
      all.detect { |object| object.name == name }
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end

    def new_from_filename(name)
      path_files = name.gsub('.mp3', '').split(' - ')
      artist = Artist.find_or_create_by_name(path_files[0])
      genre = Genre.find_or_create_by_name(path_files[2])
      Song.new(path_files[1], artist, genre)
    end

    def create_from_filename(name)
      object = new_from_filename(name)
      object if object.save
    end
    
  end
end
