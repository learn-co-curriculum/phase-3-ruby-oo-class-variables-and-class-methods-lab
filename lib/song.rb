require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@count = 0
    @@genres = []
    @@artists = []

    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@genres << genre

    end

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
        genre_histogram = {}
        @@genres.each do |genre|
          genre_histogram[genre] ||= 0
          genre_histogram[genre] += 1
        end
        genre_histogram
      end
    
      def self.artist_count
        artist_histogram = {}
        @@artists.each do |artist|
          artist_histogram[artist] ||= 0
          artist_histogram[artist] += 1
        end
        artist_histogram
      end
end
ninety_nine_problems = Song.new("99 problems", "Jay-Z", "rap")
ninety_nine_problems.name
# => "99 Problems"

ninety_nine_problems.artist
# => "Jay-Z"

ninety_nine_problems.genre
# => "rap"

puts Song.count
puts Song.genres
puts Song.artists
puts Song.genre_count
puts Song.artist_count


binding.pry