# frozen_string_literal: true

# represents the game prompts to be displayed
module Display

  def display_choice(player)
    puts "#{player.name}, choose a column..."
    gets.chomp
  end

  def display_error
    puts 'Invalid input, must be a number 1-7'
  end
end
