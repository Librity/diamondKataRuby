# frozen_string_literal: true

# A class that makes Diamonds & stuff
class Diamond
  LETTERS = ('A'..'Z').to_a

  def build(letter)
    (+letter).upcase!.freeze
    index = LETTERS.index(letter)
    'Invalid parameters!' unless index

    aux = (index + 1) * 2
    total_columns = aux.odd? ? aux : aux - 1
    diamond = ''
    row = '_' * total_columns

    (index + 1).times do |row_number|
      first_letter_position = index - row_number
      last_letter_position = (total_columns - 1) - (index - row_number)

      row[first_letter_position] = LETTERS[row_number]
      row[last_letter_position] = LETTERS[row_number] unless row_number.zero?

      diamond += row + "\n"
      row = '_' * total_columns
    end

    diamond + diamond.split("\n")[0..-2].reverse.map { |l| l + "\n" }.join
  end
end
