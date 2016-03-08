require 'spec_helper'

describe Pushbots do
  let(:token) { 'token' }
  let(:platform) { :ios }
  let(:message) { 'Hello World!!!' }
  let(:sound) { 'sound' }
  context 'initialize' do
    context 'with invalid data' do
      it 'raises wrong platform error' do
        expect do
          described_class::One.new(:other, token, message, sound)
        end.to raise_error(RuntimeError, 'platform is not valid')
      end
    end

    context 'with valid data' do
      it 'initializes' do
        described_class::One.new(platform, token, message, sound)
      end
    end
  end
end
