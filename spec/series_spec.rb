describe 'Series' do
  describe '::new' do
    it 'gets initialized with a name' do
      expect{Series.new("Voyager")}.to_not raise_error
    end
  end
end
