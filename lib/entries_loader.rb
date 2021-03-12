# frozen_string_literal: true

# This class loads entries from file path
class EntriesLoader
  def load_entries_into_enumerator(file_path)
    return [] unless FileValidator.file_suitable?(file_path)

    IO.foreach(file_path).lazy
  end
end
