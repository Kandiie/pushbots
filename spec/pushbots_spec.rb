require 'spec_helper'

describe Pushbots do
  let(:token) { 'token' }
  let(:platform) { :ios }
  let(:message) { 'Hello World!!!' }
  let(:sound) { 'sound' }
  context 'initialize' do
    context 'single device' do
      context 'with invalid paltform' do
        it 'raises wrong platform error (empty)' do
          expect do
            described_class::One.new('', token, message, sound)
          end.to raise_error(RuntimeError, 'platform is not valid')
        end

        it 'raises wrong platform error (nil)' do
          expect do
            described_class::One.new(nil, token, message, sound)
          end.to raise_error(RuntimeError, 'platform is not valid')
        end

        it 'raises wrong platform error (wrong)' do
          expect do
            described_class::One.new(:other, token, message, sound)
          end.to raise_error(RuntimeError, 'platform is not valid')
        end
      end
      context 'with valid data' do
        it 'initializes' do
          described_class::One.new(:ios, token, message, sound)
        end
      end
    end
    context 'multiple device' do
      context 'with invalid platform' do
        it 'raises wrong platform error (empty)' do
          expect do
            described_class::All.new([], message, sound)
          end.to raise_error(RuntimeError, 'platform is not valid')
        end

        it 'raises wrong platform error (nil)' do
          expect do
            described_class::All.new([], message, sound)
          end.to raise_error(RuntimeError, 'platform is not valid')
        end

        it 'raises wrong platform error (wrong)' do
          expect do
            described_class::All.new([:ios, :androiid], message, sound)
          end.to raise_error(RuntimeError, 'platform is not valid')
        end
      end
      context 'with valid data' do
        it 'initializes' do
          described_class::All.new([:ios], message, sound)
        end
      end
    end
  end
end
