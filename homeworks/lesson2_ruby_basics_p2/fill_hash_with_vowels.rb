class FillHashWithVowels
  ALPHABET = ('a'..'z').to_a
  VOWELS = /[aeiou]/

  def self.fill_hash
    vowels_hash = {}
    ALPHABET.each { |letter| vowels_hash[ALPHABET.index(letter) + 1] = letter if letter.match(VOWELS) }
    vowels_hash
  end
end