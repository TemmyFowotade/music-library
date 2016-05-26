require_relative './concerns/findable.rb'

class MusicImporter
  extend Concerns::Findable

  attr_reader :path, :files, :import

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path)[2..-1]
  end

  def import
    files.each { |file| self.class.create_from_filename(file) }
  end
end
