# frozen_string_literal: true

require './lib/log_manager'

describe 'Integration test' do
  let(:test_log_path) { 'spec/fixtures/test.log' }
  let(:result_page_visits) do
    "\nList of webpages with most page views ordered from most pages views to less page views\n" \
    "/help_page/1 6 visits \n/home 3 visits \n/about/2 3 visits \n" \
    "/index 3 visits \n/contact 3 visits \n/about 2 visits \n"
  end
  let(:result_page_uniq_views) do
    "\nList of webpages with most unique page views\n" \
    "/help_page/1 5 unique views \n/home 3 unique views \n/index 3 unique views \n" \
    "/about/2 2 unique views \n/about 2 unique views \n/contact 2 unique views \n"
  end
  let(:log_manager) { LogManager.new([test_log_path]) }

  it 'checks output page visits' do
    expect { log_manager.show_page_visits }.to output(result_page_visits).to_stdout
  end

  it 'checks output page unique views' do
    expect { log_manager.show_pages_uniq_views }.to output(result_page_uniq_views).to_stdout
  end
end
