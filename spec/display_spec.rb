# frozen_string_literal: true

require './lib/display'
require 'pry'

describe Display do
  let(:output_string) { 'test output string' }
  let(:array) { [['/about/2', 30], ['/contact', 20], ['/index', 10]] }
  let(:header) { 'Sum visits' }
  let(:description) { 'visits' }
  let(:expected_string) { "\nSum visits\n/about/2 30 visits \n/contact 20 visits \n/index 10 visits \n" }
  let(:string_with_empty_header) { "\n\n/about/2 30 visits \n/contact 20 visits \n/index 10 visits \n" }
  let(:string_with_empty_array) { "\nSum visits\n" }
  let(:string_with_description) { "\nSum visits\n/about/2 30  \n/contact 20  \n/index 10  \n" }

  it 'checks correct display output at console' do
    expect { described_class.new(header: header, array: array, description: description).output }
      .to output(expected_string).to_stdout
  end

  it 'checks result with empty header' do
    expect { described_class.new(header: '', array: array, description: description).output }
      .to output(string_with_empty_header).to_stdout
  end

  it 'checks result with empty array' do
    expect { described_class.new(header: header, array: [], description: description).output }
      .to output(string_with_empty_array).to_stdout
  end

  it 'checks result with empty description' do
    expect { described_class.new(header: header, array: array, description: '').output }
      .to output(string_with_description).to_stdout
  end
end
