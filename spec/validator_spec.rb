# frozen_string_literal: true

require './lib/validator'

describe Validator do
  let(:correct_test_log) { 'spec/fixtures/test.log' }
  let(:incorrect_file_path) { 'spec/fixtures/unexisting_file.log' }
  let(:empty_test_file) { 'spec/fixtures/test_empty.log' }

  it 'correct' do
    expect(Validator.file_suitable?(correct_test_log)).to eq(true)
  end

  it 'empty' do
    expect(Validator.file_suitable?(empty_test_file)).to eq(false)
  end

  it 'incorrect path file' do
    expect(Validator.file_suitable?(incorrect_file_path)).to eq(false)
  end
end