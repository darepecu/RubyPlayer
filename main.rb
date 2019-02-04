require 'byebug'
require 'colorize'
require 'rubocop'
require_relative './playlist.rb'
require_relative './song.rb'
require_relative './ruby_player.rb'

if ARGV.length != 1
  puts 'We need exactly a arguments(The playlist path)'
  exit
end

@position = 0

playlist = RubyPlayer::Playlist.new(ARGV[0])
home = AppRubyPlayer.new(playlist)

home.clear_page
home.associate_songs
home.renderize_all_page(@position)
input_client = STDIN.gets.chomp.upcase
home.clear_page

loop do
  break if input_client.eql? 'E'

  puts 'Last command: ' + input_client
  case input_client.upcase
  when 'N'
    home.clear_page
    home.renderize_all_page(@position + 1)
    @position += 1
  when 'A'
    home.clear_page
    home.renderize_all_page(@position - 1)
    @position -= 1
  when 'P'
    home.playlist.playing_song(@position)
  when 'S'
    home.playlist.stopping_song
  else
    'Please, check your choise'
  end

  input_client = STDIN.gets.chomp
end
