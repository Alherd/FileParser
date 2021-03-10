# frozen_string_literal: true

require './lib/parser'

describe Parser do # rubocop:disable Metrics/BlockLength
  let(:initial_enumerator) do
    ['/help_page/1 126.318.035.038', '/contact 184.123.665.067', '/home 184.123.665.067',
     '/about/2 444.701.448.104', '/help_page/1 929.398.951.889', '/index 444.701.448.104',
     '/help_page/1 722.247.931.582', '/about 061.945.150.735', '/help_page/1 646.865.545.408',
     '/home 235.313.352.950', '/contact 184.123.665.067', '/help_page/1 543.910.244.929',
     '/home 316.433.849.805', '/about/2 444.701.448.104', '/contact 543.910.244.929',
     '/about 126.318.035.038', '/about/2 836.973.694.403', '/index 316.433.849.805',
     '/index 802.683.925.780', '/help_page/1 929.398.951.889']
  end
  let(:expected_parsed_array_page_visits) do
    [['/help_page/1', 6], ['/contact', 3], ['/home', 3], ['/about/2', 3], ['/index', 3], ['/about', 2]]
  end
  let(:expected_parsed_array_page_unique_views) do
    [['/help_page/1', 5], ['/contact', 2], ['/home', 3], ['/about/2', 2], ['/index', 3], ['/about', 2]]
  end

  it 'checks correct page visits' do
    parsed_array = subject.parse(initial_enumerator, Parser::PAGE_VISITS)

    expect(parsed_array).to eq(expected_parsed_array_page_visits)
  end

  it 'checks correct page unique views' do
    parsed_array = subject.parse(initial_enumerator, Parser::PAGE_UNIQ_VIEWS)

    expect(parsed_array).to eq(expected_parsed_array_page_unique_views)
  end

  it 'returns empty page visits when initial array is empty' do
    parsed_array = subject.parse([], Parser::PAGE_VISITS)

    expect(parsed_array).to eq([])
  end

  it 'returns empty page unique views when initial array is empty' do
    parsed_array = subject.parse([], Parser::PAGE_UNIQ_VIEWS)

    expect(parsed_array).to eq([])
  end

  it 'returns empty array when parser type is unknown' do
    parsed_array = subject.parse(initial_enumerator, 'unknown')

    expect(parsed_array).to eq([])
  end
end
