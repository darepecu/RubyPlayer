module RubyPlayer
  # Clase ue representa el objero cancion
  class Song
    def initialize(path, name_song, artist)
      @path = path
      @name_song = name_song
      @artist = artist
    end

    def play_song
      # pid = Process.spawn('mpg321', @path, [:out, :err] => './log')
      puts "Reproducionedo -> #{@name_song}"
    end

    def stop_song
      puts "Pausando -> #{@name_song}"
    end

    def data_song
      "#{@artist} - #{@name_song}"
    end
  end
end
