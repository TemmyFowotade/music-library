module Concerns
  module Findable
    def find_by_name(name)
      all.detect { |object| object.name == name }
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