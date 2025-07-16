# frozen_string_literal: true

# Represents a song with a name, artist, and genre.
# Tracks the total number of songs, as well as all artists and genres.
#
# @!attribute [r] name
#   @return [String] the name of the song
# @!attribute [r] artist
#   @return [String] the artist of the song
# @!attribute [r] genre
#   @return [String] the genre of the song
#
# @example
#   song = Song.new("Imagine", "John Lennon", "Rock")
#   song.name    #=> "Imagine"
#   song.artist  #=> "John Lennon"
#   song.genre   #=> "Rock"
class Song
  attr_reader :name, :artist, :genre

  @@count = 0
  @@artists = []
  @@genres = []

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre

    @@count += 1
    @@artists << artist
    @@genres << genre
  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.genre_count
    @@genres.tally
  end

  def self.artist_count
    @@artists.tally
  end
end
