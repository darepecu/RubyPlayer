module RubyPlayer
  # Clase ue representa el objero cancion
  class Song
    def initialize(path, name_song, artist)
      @path = path
      @name_song = name_song
      @artist = artist
      @thread_song = nil
      @pid = nil
    end

    def play_song
      puts "Reproducionedo -> #{@name_song}"
      @thread_song = Thread.new {
        @pid = Process.spawn('mpg321', @path, [:out, :err] => './log')
      }
    end

    def stop_song
      puts "Pausando -> #{@name_song}"
      Process.kill('SIGTERM', @pid) unless @pid.nil?
    end

    def data_song
      "#{@artist} - #{@name_song}"
    end
  end
end
