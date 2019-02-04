module RubyPlayer
  # Clase que representa un playlist
  class Playlist
    attr_reader :songs, :path, :playing
    def initialize(path)
      @path = path
      @songs = []
      @playing = nil
    end

    def associate_songs
      mp3files = File.join("#{@path}**", '*.mp3')
      songs_files = Dir.glob(mp3files)
      songs_files.each do |song|
        info_song = song.gsub(@path, '').split('/')
        @songs << RubyPlayer::Song.new(song, info_song[1], info_song[0])
      end
    end

    def print_playlist(position)
      @songs.each_with_index do |each_song, index|
        if index.eql? position
          full_data_song = index.to_s.concat("- #{each_song.data_song}")
          puts full_data_song.center(200).colorize(color: :light_blue, background: :white)
        else
          puts index.to_s.concat("- #{each_song.data_song}").center(200)
        end
      end
    end

    def playing_song(number_song)
      songs[number_song].play_song
      @playing = number_song
    end

    def stopping_song
      songs[@playing].stop_song unless @playing.nil?
      @playing = nil unless @playing.nil?
    end
  end
end
