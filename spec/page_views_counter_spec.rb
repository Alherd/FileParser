# frozen_string_literal: true

require './lib/page_views_counter'

describe PageViewsCounter do
  it 'checks page field of page_view_counter' do
    data_structure = described_class.new(page: '/page', views_count: 5)

    expect(data_structure.page).to eq('/page')
  end

  it 'checks views_count field of page_view_counter' do
    data_structure = described_class.new(page: '/page', views_count: 3)

    expect(data_structure.views_count).to eq(3)
  end
end
