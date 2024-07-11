class Song
  attr_accessor :name, :artist, :genre

  @@count = 0
  @@genres = []
  @@artists = []

  def self.count
    @@count
  end

  def self.genres
    @@genres.uniq
  end

  def self.artists
    @@artists.uniq
  end

  def self.genre_count
    genre_count = {}

    @@genres.each do |genre|
      if genre_count.key?(genre)
        genre_count[genre] += 1
      else
        genre_count[genre] = 1
      end
    end

    genre_count
  end

  # I Wanted to create the hashes both ways. Manual and using tally
  def self.artist_count
    @@artists.tally
  end

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@genres << genre
    @@artists << artist
  end
end
