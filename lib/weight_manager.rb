require 'json'

class Weight_Manager
  FILE_PATH = "data/weights.json"

  def load_weights
    return [] unless File.exist?(FILE_PATH)

    file = File.read(FILE_PATH)
    data = JSON.parse(file)
  end

  def save_weights(weights)
    File.write(FILE_PATH, JSON.pretty_generate(weights))
  end

  def add_weights(weights, weight)
    entry = {
      date: Time.now.strftime("%Y-%m-%d"),
    }

    weights << entry
    save_weights(weights)
  end
end