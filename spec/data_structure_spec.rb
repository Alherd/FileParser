# frozen_string_literal: true

require './lib/data_structure'

describe DataStructure do
  it 'checks url field of data structure' do
    data_structure = described_class.new(url: '/page', ip: '0.0.0.0')

    expect(data_structure.url).to eq('/page')
  end

  it 'checks ip field of data structure' do
    data_structure = described_class.new(url: '/page', ip: '0.0.0.0')

    expect(data_structure.ip).to eq('0.0.0.0')
  end
end
