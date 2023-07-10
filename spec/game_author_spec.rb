require_relative '../game_author'


RSpec.describe GameAuthor do
  describe '#to_hash' do
    it 'returns a hash representation of the game author' do
      author = GameAuthor.new('John', 'Doe')
      hash = author.to_hash

      expect(hash).to be_a(Hash)
      expect(hash[:first_name]).to eq('John')
      expect(hash[:last_name]).to eq('Doe')
    end
  end
end
