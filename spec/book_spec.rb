require_relative '../book'


RSpec.describe Book do
  describe '#to_hash' do
    it 'returns a hash representation of the book' do
      book = Book.new('2022-01-01', 'Book 1', 'Author 1', 'Good', 'Fiction')
      hash = book.to_hash

      expect(hash).to be_a(Hash)
      expect(hash[:published_date]).to eq('2022-01-01')
      expect(hash[:title]).to eq('Book 1')
      expect(hash[:author]).to eq('Author 1')
      expect(hash[:cover_state]).to eq('Good')
      expect(hash[:genre]).to eq('Fiction')
    end
  end
end
