# Your TextAnalyzer model code will go here.
class TextAnalyzer 
    attr_reader :text 
    
    def initialize(text)
        @text = text.downcase
    end

    def count_of_words
        words = text.split(" ")
        words.count
    end

    def count_of_vowels
        text.scan(/[aeoui]/).count
    end

    def count_of_consonants
        text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
    end

    def most_used_letter
        s1 = text.gsub(/[^a-z]/, '')
        arr = s1.split('')
        arr1 = arr.uniq
        arr2 = {}
        arr1.map do |c|
            arr2[c] = arr.count(c)
        end
        biggest = { arr2.keys.first => arr2.values.first}

        arr2.each do |key, value|
            if value > biggest.values.first
                biggest = {}
                biggest[key] = value
            end
        end
        biggest
    end
end
my_text = TextAnalyzer.new("The rain in Spain stays mainly on the plain.")
puts my_text.count_of_words #=> 9
puts my_text.count_of_vowels #=> 13
puts my_text.count_of_consonants #=> 22
puts my_text.most_used_letter