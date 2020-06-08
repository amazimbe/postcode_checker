describe FetchPostcode do
  let(:postcode) { 'SE1 7QA' }

  it 'fetches postcode info remotely' do
    VCR.use_cassette 'se17qa' do
      response = described_class.call(postcode)
      expect(response['status']).to eq 200
      expect(response['result']['lsoa']).to eq 'Lambeth 036B'
    end
  end

  context 'unknown postcode' do
    let(:postcode) { 'SH24 7QA' }

    it 'returns the expected fields' do
      VCR.use_cassette 'sh247qa' do
        response = described_class.call(postcode)
        expect(response['status']).to eq 404
        expect(response['error']).to eq 'Postcode not found'
      end
    end
  end

  context 'POSTCODE_API_URL is missing' do
    before do
      ENV.delete('POSTCODE_API_URL')
    end

    it 'raises an error' do
      expect { described_class.call(postcode) }.to raise_error(RuntimeError)
    end
  end
end