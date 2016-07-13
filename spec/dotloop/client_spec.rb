require_relative '../spec_helper'

RSpec.describe Dotloop::Client do
  let(:api_key) { 'blah' }
  subject { Dotloop::Client.new(api_key: api_key) }

  describe '#initialize' do
    it 'should take an api key' do
      expect(subject).to be_a(Dotloop::Client)
      expect(subject.api_key).to eq('blah')
    end

    context 'without an api key' do
      let(:api_key) { nil }
      it 'the constuctor should whine' do
        expect { subject }.to raise_error
      end
    end
  end

  describe '#get' do
    let(:parsed_result) { { blahBlog: 42 } }
    let(:code) { 200 }
    let(:response) { double(code: code, parsed_result: parsed_result) }

    it 'should call HTTParty get with the correct params' do
      expect(subject.class).to receive(:get).with('foo', bar: 2).and_return(response)
      subject.get('foo', bar: 2)
    end

    context 'when there is an error' do
      let(:code) { 234 }
      it 'should raise an error if the response code is not 200' do
        expect(subject.class).to receive(:get).with('foo', bar: 2).and_return(response)
        expect { subject.get('foo', bar: 2) }.to raise_error
      end
    end

    context 'when the response is a single object' do
      it 'it should snake the camels' do
        expect(subject.class).to receive(:get).and_return(response)
        expect(subject.get('foo', bar: 15)).to eq(blah_blog: 42)
      end
    end

    context 'when the response is an array' do
      let(:parsed_result) do
        [
          { fooBar: 10 },
          { snakeFace: 22 }
        ]
      end
      it 'should snake all the camels' do
        expect(subject.class).to receive(:get).and_return(response)
        expect(subject.get('foo', bar: 15)).to eq(
          [
            { foo_bar: 10 },
            { snake_face: 22 }
          ]
        )
      end
    end
  end

  describe '#Profile' do
    it 'should return a Profile object' do
      expect(subject.Profile).to be_a(Dotloop::Profile)
    end
  end

  describe '#Loop' do
    it 'should return a Loop object' do
      expect(subject.Loop).to be_a(Dotloop::Loop)
    end
  end
end