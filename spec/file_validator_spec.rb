# frozen_string_literal: true

require './lib/file_validator'

describe FileValidator do
  let(:correct_test_log) { 'spec/fixtures/test.log' }
  let(:incorrect_file_path) { 'spec/fixtures/unexisting_file.log' }
  let(:empty_test_file) { 'spec/fixtures/test_empty.log' }

  it 'checks correct validation' do
    expect(described_class.file_suitable?(correct_test_log)).to eq(true)
  end

  it 'checks validation of empty file' do
    expect(described_class.file_suitable?(empty_test_file)).to eq(false)
  end

  it 'checks validation of incorrect path file' do
    expect(described_class.file_suitable?(incorrect_file_path)).to eq(false)
  end
end
