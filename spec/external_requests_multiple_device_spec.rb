# spec/features/external_request_spec.rb
require 'spec_helper'

describe Pushbots do
  let(:token) { 'token' }
  let(:platforms) { [:ios] }
  let(:message) { 'Hello World!!!' }
  let(:schedule) { '2016-03-14T19:25:53-06:00' }
  context 'request' do
    context 'multiple devices' do
      context 'with valid data' do
        it 'can push' do
          push = described_class::All.new(platforms, message, schedule)
          push.send
          expect(push.response.code).to eq(200)
        end
      end

      context 'with invalid data' do
        context 'nil or empty message' do
          it 'can not push (nil)' do
            push = described_class::All.new([:ios], nil, schedule)
            push.send
            expect(push.response.code).to eq(400)
          end

          it 'can not push (empty)' do
            push = described_class::All.new([:ios], '', schedule)
            push.send
            expect(push.response.code).to eq(400)
          end
        end

        context 'nil or empty schedule' do
          it 'can not push (nil)' do
            push = described_class::All.new([:ios], message, nil)
            push.send
            expect(push.response.code).to eq(400)
          end

          it 'can not push (empty)' do
            push = described_class::All.new([:ios], message, '')
            push.send
            expect(push.response.code).to eq(400)
          end
        end
      end
    end
  end
end
