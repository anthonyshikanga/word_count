class String
    #Account for case sensitivity!
  define_method(:word_count) do |special_word|
	phrase= self.downcase()
	special_word.downcase!()
	counter = 0
	punctuation = [".",",","!","",":",";","?","'"]
	

	phrase_array=phrase.split()
	phrase_array.each() do |word_to_check|

   #check for punctuations

        word_array=word_to_check.split("")
	stripped_word_array = []
	word_array.each() do |letter|

	  if !punctuation.include()?(letter)
	     stripped_word_array.push(letter)
	  end
	end
    #combine words together
	stripped_word=stripped_word_array.join("")

        if stripped_word ==special_word
           counter += 1
        end
  
      end

	return counter 
      end


end
