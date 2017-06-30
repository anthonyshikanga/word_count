require('rspec')
require('word_count')

describe('String#word_count') do

  it("returns 1 when given a 1 word string that is an exact match to the word to search for") do
    expect("foo".word_count("foo")).to(eq(1))
  end

  it("returns 0 when given a 1 word string that does not match the word to search for") do
    expect("foo".word_count("bar")).to(eq(0))
  end

  it("returns 2 when given a phrase with 2 exact matches") do
    expect("Hello world it is early this morning in the world today.".word_count("world")).to(eq(2))
  end

  it("returns the correct number, even if punctuation is included in the phrase") do
    expect("Hello, world. It is early this morning in the world!".word_count("world")).to(eq(2))
  end  

  it("returns the correct number, ignoring case") do
    expect("Hello, World. It is early this morning in the world!".word_count("WORLD")).to(eq(2))
  end

  it("correctly ignores partial words") do
    expect("Hello, World. It is early this morning in the worldly world!".word_count("WORLD")).to(eq(2))
end

end
