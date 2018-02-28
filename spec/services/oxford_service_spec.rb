require 'rails_helper'

describe OxfordService do
  describe "instance methods" do
    it "it exists" do
      oxford = OxfordService.new

      expect(oxford).to be_a OxfordService
    end

    it "can validate a word by parsing" do
      oxford = OxfordService.new
      oxford.validate_word("pencil")

      expect(oxford.validate_word("pencil")).to be_a Hash
    end

    it "will return false for an invalid word" do
      oxford = OxfordService.new
      oxford.validate_word("oralehomes")

      expect(oxford.validate_word("oralehomes")).to eq(false)
    end
  end
end
