# frozen_string_literal: true

require './lib/page_views_display_structure'
require './lib/page_views_counter'

describe PageViewsDisplayStructure do
  let(:page_views) { [PageViewsCounter.new(page: '/page', views_count: 5)] }

  it 'checks header field of display structure' do
    data_structure = described_class.new(header: 'test_header', page_views: page_views, description: 'test_views')

    expect(data_structure.header).to eq('test_header')
  end

  it 'checks page_views field of display structure' do
    data_structure = described_class.new(header: 'test_header', page_views: page_views, description: 'test_views')

    expect(data_structure.page_views).to eq(page_views)
  end

  it 'checks views_count field of display structure' do
    data_structure = described_class.new(header: 'test_header', page_views: page_views, description: 'test_views')

    expect(data_structure.description).to eq('test_views')
  end
end
