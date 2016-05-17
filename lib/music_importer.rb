class MusicImporter


  attr_reader :path
  attr_accessor :files

  def initialize(path)
    @path = path
  end

  def files  
    @files ||= []
  end

end