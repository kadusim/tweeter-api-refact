require 'rails_helper'

RSpec.describe FormatTweets do

  class Klass
    include FormatTweets
  end

  context 'when format tweets module was included and call format when not implemented get_formated_tweets method' do

    before(:each) do
      @tweets = TweetsService.new.call
      @klass  = Klass.new
    end

    it 'returns Not implemented method error, this method need be overwrite on child class' do
      expect{@klass.format(@tweets)}.to raise_error(ExceptionHandler::MethodNotImplementedError)
    end

  end

end
