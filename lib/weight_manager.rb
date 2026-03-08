require 'json'

class WeightManager
  FILE_PATH = "data/weights.json"

  def load_weights
    return [] unless File.exist?(FILE_PATH)

    file = File.read(FILE_PATH)
    JSON.parse(file)
  end




  def save_weights(weights)
    File.write(FILE_PATH, JSON.pretty_generate(weights))
  end

  def add_weight(weights, weight)
    entry = {
      "date" => Time.now.strftime("%Y-%m-%d"),
      "weight" => weight
    }

    weights << entry
    save_weights(weights)
  end
end