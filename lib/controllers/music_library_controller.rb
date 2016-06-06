require_relative '../music_importer'

class MusicLibraryController
  def initialize(file_path = './db/mp3s')
    music_importer = MusicImporter.new(file_path)
    music_importer.import
  end

  def call
    Message.command_instructions
    loop do
      Message.enter_command
      input = gets.chomp
      break if input == 'exit'
      method_name = input.tr(' ', '_').to_sym
      send(method_name)
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |song, count|
      Message.notice("#{count}. #{song}", :cyan)
    end
  end

  def list_genre
    print_model_songs(:genre)
  end

  def list_artist
    print_model_songs(:artist)
  end

  def play_song
    Message.enter_song_number
    validate_song_number(gets.chomp)
  end

  def list_genres
    print_each_name(Genre)
  end

  def list_artists
    print_each_name(Artist)
  end

  def print_model_songs(model)
    Message.model_info(model)
    user_input = gets.chomp
    Song.all.each do |song|
      puts song.to_s if song.send(model).name == user_input
    end
  end

  def print_each_name(model)
    model.all.each { |item| puts item.name }
  end

  def validate_song_number(song_index)
    song_number = song_index.to_i
    song_length = Song.all.length
    if !is_i?(song_index) || song_number > song_length || song_number < 1
      Message.invalid_song_number
    else
      song_to_play = Song.all[song_number - 1]
      Message.playing_song(song_to_play)
    end
  end

  private

  def is_i?(integer)
    /\A[-+]?\d+\z/ === integer.to_s
  end

  def method_missing(method_name, *_arguments)
    if method_name.eql?(:help)
      Message.command_instructions
    else
      Message.invalid_command(method_name)
    end
  end
end
