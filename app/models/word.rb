class Word
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def validate
    if oxford.validate_word(word) == false
      "#{@word} is not a valid word"
    else
      "#{@word} is a valid word and its root form is #{oxford.validate_word(word)[:results].first[:lexicalEntries].first[:inflectionOf].first[:text]}"
    end
  end

  private

    def oxford
      @oxford = OxfordService.new
    end

end
