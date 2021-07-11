require "spec_helper"

describe Song do
  describe 'instance methods' do
    let!(:hit_me) { Song.new('hit me baby one more time', 'Brittany Spears', 'pop') }
    
    describe '#initialize' do 
      it 'takes in three arguments: a name, artist and genre' do 
        expect { Song.new('hit me baby one more time', 'Brittany Spears', 'pop') }.not_to raise_error
      end
    end

    describe '#name' do 
      it 'returns the name' do 
        expect(hit_me.name).to eq('hit me baby one more time')
      end
    end

    describe '#artist' do 
      it 'returns the artist' do 
        expect(hit_me.artist).to eq('Brittany Spears')
      end
    end

    describe '#genre' do 
      it 'returns the genre' do
        expect(hit_me.genre).to eq('pop') 
      end
    end
  end

  describe 'class methods' do
    # This runs before each test and creates new instances using the Song class
    before do
      Song.new("Lucifer", "Jay-Z", "rap")
      Song.new("99 Problems", "Jay-Z", "rap")
      Song.new("hit me baby one more time", "Brittany Spears", "pop")
    end
    
    # This resets the class variables after each test runs
    after do 
      Song.class_variable_set(:@@artists, [])
      Song.class_variable_set(:@@genres, [])
      Song.class_variable_set(:@@count, 0)
      Song.class_variable_set(:@@artist_count, {})
      Song.class_variable_set(:@@genre_count, {})
    end
  
    describe 'class variables' do 
      it 'has a class variable, @@count' do 
        expect(Song.class_variable_get(:@@count)).to eq(3)
      end
  
      it "has a class variable, @@artists, that contains all of the artists of existing songs" do 
        expect(Song.class_variable_get(:@@artists)).to match(["Jay-Z", "Jay-Z", "Brittany Spears"])
      end
  
      it "has a class variable, @@genres, that contains all of the genres of existing songs" do 
        expect(Song.class_variable_get(:@@genres)).to match(["rap", "rap", "pop"])
      end
    end
  
    describe ".count" do 
      it "is a class method that returns that number of songs created" do
        expect(Song.count).to eq(3)
      end
    end
  
    describe ".artists" do
      it "is a class method that returns a unique array of artists of existing songs" do 
        expect(Song.artists).to match(["Jay-Z", "Brittany Spears"])
      end 
    end
  
    describe ".genres" do 
      it "is a class method that returns a unique array of genres of existing songs" do 
        expect(Song.genres).to match(["rap", "pop"])
      end
    end
  
    describe ".genre_count" do 
      it "is a class method that returns a hash of genres and the number of songs that have those genres" do 
        expect(Song.genre_count).to eq({ "pop" => 1, "rap" => 2 })
      end
    end
  
    describe ".artist_count" do 
      it "is a class method that returns a hash of artists and the number of songs that have those artists" do 
        expect(Song.artist_count).to eq({ "Brittany Spears" => 1, "Jay-Z" => 2 })
      end
    end
  end
 
end
