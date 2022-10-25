class Song
  attr_accessor :name, :artist, :genre
  @@count = 0
  @@artists = []
  @@genres = []
  #Initialize name, artist, & genre
  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1

    @@artists << artist
    @@genres << genre
  end

  def self.name
    @@name
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.count
    @@count
  end

  def self.genre_count
    @@genres.tally
  end

  def self.artist_count
    @@artists.tally
  end
end

new_song = Song.new("hit me baby one more time", "Brittany Spears", "pop")
new_song.name
new_song.artist
new_song.genre
