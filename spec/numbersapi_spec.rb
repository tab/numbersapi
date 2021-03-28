RSpec.describe Numbersapi do
  extend NumbersApiRequestsHelper

  it "has a version number" do
    expect(Numbersapi::VERSION).not_to be nil
  end

  shared_examples 'should be found' do
    it { expect(client.found).to be_truthy }
  end

  shared_examples 'should be not_found' do
    it { expect(client.found).to be_falsey }
  end

  shared_examples 'should be trivia type' do
    it { expect(client.type).to eq("trivia") }
  end

  shared_examples 'should be date type' do
    it { expect(client.type).to eq("date") }
  end

  shared_examples 'should be math type' do
    it { expect(client.type).to eq("math") }
  end

  shared_examples 'should be year type' do
    it { expect(client.type).to eq("year") }
  end

  shared_examples 'should not contain a number' do
    it { expect(client.number).to eq(nil) }
  end

  shared_examples 'should contain an error' do
    it { expect(client.error).to eq("not a number") }
  end

  describe '#date' do
    context "when is nil" do
      let(:client){ Numbersapi.date(nil, nil) }

      include_examples 'should be not_found'
      include_examples 'should contain an error'
    end

    context "when not a number" do
      let(:client){ Numbersapi.date(FFaker::Lorem.word, FFaker::Lorem.word) }

      include_examples 'should be not_found'
      include_examples 'should contain an error'
    end

    context "when successful request" do
      stub_success_request

      let(:client){ Numbersapi.date(20, 03) }
      let(:body){ JSON.parse(File.read(File.join(__dir__, 'fixtures/date.json'))) }

      include_examples 'should be found'
      include_examples 'should be date type'

      it 'should contain a number' do
        expect(client.number).to eq(80)
      end

      it 'should contain a year' do
        expect(client.year).to eq(235)
      end

      it 'should contain text' do
        expect(client.text).to include("March 20th is the day in 235")
      end
    end
  end

  describe '#random' do
    context "when successful request" do
      stub_success_request

      let(:client){ Numbersapi.random }
      let(:body){ JSON.parse(File.read(File.join(__dir__, 'fixtures/random.json'))) }

      include_examples 'should be found'
      include_examples 'should be trivia type'

      it 'should contain number' do
        expect(client.number).to eq(112)
      end

      it 'should contain text' do
        expect(client.text).to include("112 is the number on mobile phones")
      end
    end
  end

  describe '#math' do
    context "when is nil" do
      let(:client){ Numbersapi.math(nil) }

      include_examples 'should be not_found'
      include_examples 'should contain an error'
    end

    context "when not a number" do
      let(:client){ Numbersapi.math(FFaker::Lorem.word) }

      include_examples 'should be not_found'
      include_examples 'should contain an error'
    end

    context "when successful request" do
      stub_success_request

      let(:client){ Numbersapi.math(100) }
      let(:body){ JSON.parse(File.read(File.join(__dir__, 'fixtures/math.json'))) }

      include_examples 'should be found'
      include_examples 'should be math type'

      it 'should contain number' do
        expect(client.number).to eq(100)
      end

      it 'should contain text' do
        expect(client.text).to include("100 is the square of 10")
      end
    end
  end

  describe '#trivia' do
    context "when is nil" do
      let(:client){ Numbersapi.trivia(nil) }

      include_examples 'should be not_found'
      include_examples 'should contain an error'
    end

    context "when not a number" do
      let(:client){ Numbersapi.trivia(FFaker::Lorem.word) }

      include_examples 'should be not_found'
      include_examples 'should contain an error'
    end

    context "when successful request" do
      stub_success_request

      let(:client){ Numbersapi.trivia(21) }
      let(:body){ JSON.parse(File.read(File.join(__dir__, 'fixtures/trivia.json'))) }

      include_examples 'should be found'
      include_examples 'should be trivia type'

      it 'should contain number' do
        expect(client.number).to eq(21)
      end

      it 'should contain text' do
        expect(client.text).to include("21 is the number of trump cards")
      end
    end
  end

  describe '#year' do
    context "when is nil" do
      let(:client){ Numbersapi.year(nil) }

      include_examples 'should be not_found'
      include_examples 'should contain an error'
    end

    context "when not a number" do
      let(:client){ Numbersapi.year(FFaker::Lorem.word) }

      include_examples 'should be not_found'
      include_examples 'should contain an error'
    end

    context "when successful request" do
      stub_success_request

      let(:client){ Numbersapi.year(1980) }
      let(:body){ JSON.parse(File.read(File.join(__dir__, 'fixtures/year.json'))) }

      include_examples 'should be found'
      include_examples 'should be year type'

      it 'should contain number' do
        expect(client.number).to eq(1980)
      end

      it 'should contain text' do
        expect(client.text).to include("1980 is the year that Rosie Ruiz wins the Boston Marathon")
      end
    end
  end

end
