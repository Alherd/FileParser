# frozen_string_literal: true

require './lib/entries_loader'
require './lib/file_validator'

describe EntriesLoader do
  let(:correct_test_log) { 'spec/fixtures/test.log' }
  let(:incorrect_file_path) { 'spec/fixtures/unexisting_file.log' }

  it 'checks that file is loaded successfully' do
    expect(subject.load_entries_into_enumerator(correct_test_log)).to_not eq([])
  end

  it 'checks that file is not loaded' do
    expect(subject.load_entries_into_enumerator(incorrect_file_path)).to eq([])
  end

  it 'checks equal result from one file' do
    first_enumerator = subject.load_entries_into_enumerator(correct_test_log)
    second_enumerator = subject.load_entries_into_enumerator(correct_test_log)

    expect(first_enumerator.to_a).to eq(second_enumerator.to_a)
  end

  it 'checks instanse of result' do
    expect(subject.load_entries_into_enumerator(correct_test_log).instance_of?(Enumerator::Lazy)).to be_truthy
  end
end
