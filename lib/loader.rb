# frozen_string_literal: true

# This class loads entries from file path
class Loader
  def load(file_path)
    return [] unless Validator.file_suitable?(file_path)

    IO.foreach(file_path).lazy
  end
end
