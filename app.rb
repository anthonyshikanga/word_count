
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/wordcounter')

get('/') do
  erb(:form)
end

get('/wordcounter') do
  phrase = params.fetch('phrase')
  word = params.fetch('word')

  if phrase == "" || word == ""
    @message = "<span id='error'>Invalid input. Please fill in both input fields.</span>"
  elsif word.include?(" ")
    @message = "<span id='error'>Invalid input. Please search for a single word only.</span>"
  else
    counter = phrase.wordcount(word)
    if counter == 0
      @message = "I was unable to locate the word &ldquo;<span class='word'>".concat(word).concat("</span>&rdquo; in your text.")
    elsif counter == 1
      @message = "I found the word &ldquo;<span class='word'>".concat(word).concat("</span>&rdquo; ").concat(counter.to_s).concat(" time in your text.")
    else
      @message = "I found the word &ldquo;<span class='word'>".concat(word).concat("</span>&rdquo; ").concat(counter.to_s).concat(" times in your text.")
    end
    @highlighted_phrase = "<div id='phrase-container'><span id='phrase'>" + phrase.highlight(word) + "</span></div>"
  end 
  erb(:wordcounter)
end
