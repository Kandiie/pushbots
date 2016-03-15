# spec/features/external_request_spec.rb
require 'spec_helper'

describe Pushbots do
  let(:token) { 'token' }
  let(:platform) { :android }
  let(:message) { 'Hello World!!!' }
  let(:sound) { 'sound' }
  context 'request' do
    context 'single device' do
      context 'with valid data' do
        it 'can push' do
          push = described_class::One.new(platform, token, message, sound)
          push.send
          expect(push.response.code).to eq(200)
        end
      end

      context 'with invalid data' do
        context 'nil or empty token' do
          it 'can not push (empty)' do
            push = described_class::One.new(platform, '', message, sound)
            push.send
            expect(push.response.code).to eq(400)
          end

          it 'can not push (nil)' do
            push = described_class::One.new(platform, nil, message, sound)
            push.send
            expect(push.response.code).to eq(400)
          end
        end

        context 'nil or empty message' do
          it 'can not push (empty)' do
            push = described_class::One.new(platform, token, '', sound)
            push.send
            expect(push.response.code).to eq(400)
          end

          it 'can not push (nil)' do
            push = described_class::One.new(platform, token, nil, sound)
            push.send
            expect(push.response.code).to eq(400)
          end
        end

        context 'nil or empty sound' do
          it 'can not push (empty)' do
            push = described_class::One.new(platform, token, message, '')
            push.send
            expect(push.response.code).to eq(400)
          end

          it 'can not push (nil)' do
            push = described_class::One.new(platform, token, message, nil)
            push.send
            expect(push.response.code).to eq(400)
          end
        end
      end
    end
  end
end
