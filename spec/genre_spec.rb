require_relative '../genre'


RSpec.describe Genre do
  describe '#to_hash' do
    it 'returns a hash representation of the genre' do
      genre = Genre.new('Rock')
      hash = genre.to_hash

      expect(hash).to be_a(Hash)
      expect(hash['name']).to eq('Rock')
    end
  end
end
