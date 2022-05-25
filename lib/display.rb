# frozen_string_literal: true

# represents the game prompts to be displayed
module Display
  def display_choice(player)
    puts "#{player}, choose a column..."
    gets.chomp
  end

  def display_error
    puts 'Invalid input, must be a number 1-7'
  end

  def display_winner(player)
    puts "#{player} wins!!!!!"
  end

  def display_tie
    puts 'It is a tie!'
  end
end
