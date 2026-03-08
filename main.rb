# frozen_string_literal: true
require_relative 'lib/weight_manager'
require_relative 'lib/analyzer'
require_relative 'lib/chart'

manager = WeightManager.new
weights = manager.load_weights

loop do
  puts '--- Трекер ваги ---'
  puts '1. Додати вагу'
  puts '2. Показати історію'
  puts '3. Вийти'

  print('Оберіть дію: ')
  choice = gets.chomp

  case choice
  when '1'
    print 'Введіть вашу вагу: '
    weight = gets.chomp.to_f

    manager.add_weight(weights, weight)
    puts "Вага збережена!"

  when '2'
    if weights.empty?
      puts "Історія порожня"
    else
      weights.each do |entry|
        puts "#{entry["date"]} - #{entry["weight"]} кг"
      end
    end

  when '3'
    puts 'До побачення!'
    break

  else
    puts 'Невірний вибір!'
  end
end