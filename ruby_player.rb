require 'byebug'
require 'colorize'
load 'playlist.rb'
load 'song.rb'

# Clase que representa un reproductor
class AppRubyPlayer
  attr_reader :playlist

  def initialize(playlist)
    @playlist = playlist
    @asterisk_symbol_line = '*' * 200
    @minus_symbol_line = '-' * 200
  end

  def header
    puts @asterisk_symbol_line.colorize(:blue)
    puts @minus_symbol_line.colorize(:green).on_blue.underline
    puts 'RUBY PLAYER'.center(200).colorize(color: :light_blue)
    puts @minus_symbol_line.colorize(:green).on_blue.underline
    puts @asterisk_symbol_line.colorize(:blue)
  end

  def associate_songs
    @playlist.associate_songs
  end

  def renderize_playlist(position)
    @playlist.print_playlist(position)
  end

  def footer
    puts @asterisk_symbol_line.colorize(:blue)
    puts 'N - Next_Song  A - Anterior  P - Play  S -Stop  Q - Quit'.center(200)
    puts @asterisk_symbol_line.colorize(:blue)
  end

  def renderize_all_page(position)
    header
    renderize_playlist(position)
    footer
  end

  def clear_page
    system('clear')
  end
end
