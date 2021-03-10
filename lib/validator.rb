# frozen_string_literal: true

# This Validator checks file for existing and emptiness
class Validator
  def self.file_suitable?(file_path)
    is_suitable = true
    unless File.exist?(file_path)
      puts 'Log does not exist'
      is_suitable = false
    end

    if File.empty?(file_path)
      puts 'Log is empty'
      is_suitable = false
    end

    is_suitable
  end
end
