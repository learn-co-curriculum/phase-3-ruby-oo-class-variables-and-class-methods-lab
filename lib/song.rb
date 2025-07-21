require "pry"

class Song 
  attr_accessor :name, :artist, :genre
  
  @@count = 0
  @@artists = []
  @@genres = []

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre

    @@artists << artist
    @@genres << genre
    @@count += 1
  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.filter.uniq do |artist|
      artist
    end
  end

  def self.genres
    @@genres.filter.uniq do |genre|
      genre
    end
  end

  def self.genre_count
    @@genres.tally  
  end

  def self.artist_count
    @@artists.tally
  end

end
