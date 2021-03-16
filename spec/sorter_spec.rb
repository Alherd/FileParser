# frozen_string_literal: true

require './lib/page_views_sorter'
require './lib/page_views_counter'

describe PageViewsSorter do
  let(:initial_array) do
    [create_page_view_counter('/help_page/1', 80),
     create_page_view_counter('/contact', 89),
     create_page_view_counter('/home', 78),
     create_page_view_counter('/about/2', 90),
     create_page_view_counter('/index', 82),
     create_page_view_counter('/about', 81)]
  end
  let(:expected_array) do
    [['/about/2', 90], ['/contact', 89], ['/index', 82], ['/about', 81], ['/help_page/1', 80], ['/home', 78]]
  end

  it 'checks correct sorting' do
    sorted_array = subject.sort(initial_array)

    (0..sorted_array.count - 1).each do |i|
      expect([sorted_array[i].page, sorted_array[i].views_count]).to eq(expected_array[i])
    end
  end

  it 'checks empty array sorting' do
    sorted_array = subject.sort([])

    expect(sorted_array).to eq([])
  end

  private

  def create_page_view_counter(page, views_count)
    PageViewsCounter.new(page: page, views_count: views_count)
  end
end
