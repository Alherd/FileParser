# frozen_string_literal: true

require './lib/string_builder'

describe StringBuilder do
  let(:array) { [['/about/2', 30], ['/contact', 20], ['/index', 10]] }
  let(:header) { 'Sum visits' }
  let(:description) { 'visits' }
  let(:expected_string) { "\nSum visits\n/about/2 30 visits \n/contact 20 visits \n/index 10 visits \n" }
  let(:string_with_empty_header) { "\n\n/about/2 30 visits \n/contact 20 visits \n/index 10 visits \n" }
  let(:string_with_empty_array) { "\nSum visits\n" }
  let(:string_with_description) { "\nSum visits\n/about/2 30  \n/contact 20  \n/index 10  \n" }

  it 'checks result builded string' do
    builded_string = subject.build(header: header, array: array, description: description)

    expect(builded_string).to eq(expected_string)
  end

  it 'checks result with empty header' do
    builded_string = subject.build(header: '', array: array, description: description)

    expect(builded_string).to eq(string_with_empty_header)
  end

  it 'checks result with empty array' do
    builded_string = subject.build(header: header, array: [], description: description)

    expect(builded_string).to eq(string_with_empty_array)
  end

  it 'checks result with empty description' do
    builded_string = subject.build(header: header, array: array, description: '')

    expect(builded_string).to eq(string_with_description)
  end
end
