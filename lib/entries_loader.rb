# frozen_string_literal: true

# This class loads entries from file path
class EntriesLoader
  def load_entries_into_enumerator(file_path)
    return @log_entries unless @log_entries.nil?
    return [] unless FileValidator.file_suitable?(file_path)

    @log_entries = IO.foreach(file_path).lazy
  end
end
