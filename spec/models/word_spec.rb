require 'rails_helper'

describe Word do
  describe "instance methods" do
    it "it exists" do
      word = Word.new("dog")

      expect(word).to be_a Word
    end

    it "can return a message for a validated word" do
      word = Word.new("dog")
      word.validate

      expect(word.validate).to eq("dog is a valid word and its root form is dog")
    end

    it "can return a message for an invalid word" do
      word = Word.new("hfhh")
      word.validate

      expect(word.validate).to eq("hfhh is not a valid word")
    end
  end
end
