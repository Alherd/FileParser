# frozen_string_literal: true

require './lib/display'

describe Display do
  let(:output_string) { 'test output string' }

  it 'checks correct display output at console' do
    expect { Display.output(output_string) }.to output("#{output_string}\n").to_stdout
  end
end
