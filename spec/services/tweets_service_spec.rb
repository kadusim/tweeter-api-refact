require 'rails_helper'

RSpec.describe TweetsService do

  context 'when instancied a class tweets service' do

    before(:each) do
      @tweets = TweetsService.new
      @tweets.call
    end

    it 'returns of call must be an hash' do
      expect(@tweets.call).to be_an_instance_of(Hash)
    end

  end

end
