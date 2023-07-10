require_relative '../game'


RSpec.describe Game do
  describe '#to_hash' do
    it 'returns a hash representation of the game' do
      game = Game.new(true, '2022-01-01', '2021-01-01')
      hash = game.to_hash

      expect(hash).to be_a(Hash)
      expect(hash[:single_player]).to be(true)
      expect(hash[:last_played_at]).to eq('2022-01-01')
      expect(hash[:published_date]).to eq('2021-01-01')
    end
  end
end
