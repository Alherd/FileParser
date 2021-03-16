# frozen_string_literal: true

require './lib/console_display'
require './lib/page_views_counter'
require './lib/page_views_display_structure'

describe ConsoleDisplay do # rubocop:disable Metrics/BlockLength
  let(:output_string) { 'test output string' }
  let(:array) { [['/about/2', 30], ['/contact', 20], ['/index', 10]] }
  let(:header) { 'Sum visits' }
  let(:description) { 'visits' }
  let(:expected_string) { "\nSum visits\n/about/2 30 visits\n/contact 20 visits\n/index 10 visits\n" }
  let(:string_with_empty_header) { "\n\n/about/2 30 visits\n/contact 20 visits\n/index 10 visits\n" }
  let(:string_with_empty_array) { "\nSum visits\n\n" }
  let(:string_with_description) { "\nSum visits\n/about/2 30 \n/contact 20 \n/index 10 \n" }
  let(:page_views) do
    [create_page_view_counter('/about/2', 30),
     create_page_view_counter('/contact', 20),
     create_page_view_counter('/index', 10)]
  end
  let(:page_views_display_structure) { create_page_views_display_structure(header, page_views, description) }
  let(:page_views_display_structure_with_empty_header) do
    create_page_views_display_structure('', page_views, description)
  end
  let(:page_views_display_structure_with_empty_page_views) do
    create_page_views_display_structure(header, [], description)
  end
  let(:page_views_display_structure_with_empty_description) do
    create_page_views_display_structure(header, page_views, '')
  end

  it 'checks correct display output at console' do
    expect { described_class.new(page_views_display_structure).output }
      .to output(expected_string).to_stdout
  end

  it 'checks result with empty header' do
    expect { described_class.new(page_views_display_structure_with_empty_header).output }
      .to output(string_with_empty_header).to_stdout
  end

  it 'checks result with empty array' do
    expect { described_class.new(page_views_display_structure_with_empty_page_views).output }
      .to output(string_with_empty_array).to_stdout
  end

  it 'checks result with empty description' do
    expect { described_class.new(page_views_display_structure_with_empty_description).output }
      .to output(string_with_description).to_stdout
  end

  private

  def create_page_view_counter(page, views_count)
    PageViewsCounter.new(page: page, views_count: views_count)
  end

  def create_page_views_display_structure(header, page_views, description)
    PageViewsDisplayStructure.new(header: header, page_views: page_views, description: description)
  end
end
