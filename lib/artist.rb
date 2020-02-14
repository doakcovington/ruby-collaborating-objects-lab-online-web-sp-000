require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find {|artist| artist.name == name}
    if artist
      artist
    else
      new_artist = self.new(name)
      new_artist.save
    end
  end

  def print_songs
    @songs.each{|song| puts song.name}
  end

end
