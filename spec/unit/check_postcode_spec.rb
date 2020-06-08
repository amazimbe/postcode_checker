describe CheckPostcode do
  let(:response) do
    {
      "status"=>200,
      "result"=>{
        "postcode"=>"SE1 7QD",
        "quality"=>1,
        "country"=>"England",
        "region"=>"London",
        "lsoa"=>"#{lsoa} 034A",
        "msoa"=>"Southwark 034"
      }
    }
  end
  
  context 'lsoa starts with Southwark' do
    let(:lsoa) { 'Southwark' }

    it 'returns true' do
      expect(described_class.call(response)).to be true
    end
  end

  context 'lsoa starts with Lambeth' do
    let(:lsoa) { 'Southwark' }

    it 'returns true' do
      expect(described_class.call(response)).to be true
    end
  end

  context 'lsoa does not start with Lambeth or Southwark' do
    let(:lsoa) { 'Bedford' }

    it 'returns false' do
      expect(described_class.call(response)).to be false
    end
  end

  context 'postcode not found' do
    let(:response) do
      { 
        "status"=>404, 
        "error"=>"Postcode not found"
      }
    end

    it 'returns true' do
      expect(described_class.call(response)).to be true
    end
  end
end