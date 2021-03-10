# frozen_string_literal: true

require './lib/sorter'

describe Sorter do
  let(:initial_array) do
    [['/help_page/1', 80], ['/contact', 89], ['/home', 78], ['/about/2', 90], ['/index', 82], ['/about', 81]]
  end
  let(:expected_array) do
    [['/about/2', 90], ['/contact', 89], ['/index', 82], ['/about', 81], ['/help_page/1', 80], ['/home', 78]]
  end

  it 'checks correct sorting' do
    sorted_array = subject.sort(initial_array)

    expect(sorted_array).to eq(expected_array)
  end

  it 'checks empty array sorting' do
    sorted_array = subject.sort([])

    expect(sorted_array).to eq([])
  end
end
