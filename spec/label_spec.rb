require_relative '../label'
require_relative '../music_album'


RSpec.describe Label do
  describe '#to_hash' do
    it 'returns a hash representation of the label' do
      label = Label.new('Label 1')
      album = MusicAlbum.new('2022-01-01', 'Album 1', 'Pop', true)
      label.add_item(album)
      hash = label.to_hash

      expect(hash).to be_a(Hash)
      expect(hash[:title]).to eq('Label 1')
      expect(hash[:items]).to be_a(Array)
      expect(hash[:items][0][:name]).to eq('Album 1')
    end
  end
end
