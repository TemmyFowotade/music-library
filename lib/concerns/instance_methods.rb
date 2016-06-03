module Concerns  
  module InstanceMethods
    def add_song(song)
      unless @songs.include?(song)
        @songs << song
        song.send(self.class.name.downcase+"=", self)
      end
    end
  end
end