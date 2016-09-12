require 'spec_helper'

RSpec.describe WordCounter, type: :module do
  describe "WordCounter#count" do

    it "should return nil when given nil" do
      result = WordCounter.count(nil)
      expect(result).to be nil
    end

    it "should return nil when given empty string" do
      result = WordCounter.count("")
      expect(result).to be nil
    end

    it "should return correct hash when given one word" do
      result = WordCounter.count("hello")
      expected = {
        "hello" => 1
      }
      expect(result).to eq expected
    end

    it "should return correct hash when given a sentence" do
      result = WordCounter.count("All the code in the world")
      expected = {
        "all"  => 1,
        "the"  => 2,
        "code" => 1,
        "in"   => 1,
        "world"=> 1
      }

      expect(result).to eq expected
    end

    it "should return correct hash when given a paragraph" do
      file = File.open(File.expand_path File.dirname(__FILE__)  + "/fixtures/baby.txt")
      lyrics = file.read
      file.close

      expected = {
        "you"=>11,
        "know"=>2, 
        "love"=>5, 
        "me"=>7, 
        "i"=>18, 
        "care"=>1, 
        "just"=>6, 
        "shout"=>1, 
        "whenever"=>1, 
        "and"=>13, 
        "i'll"=>3, 
        "be"=>9, 
        "there"=>2,
        "are"=>4,
        "my"=>10, 
        "heart"=>4, 
        "we"=>3, 
        "would"=>2,
        "never"=>1,
        "ever"=>3, 
        "apart"=>1, 
        "an"=>1, 
        "item"=>1,
        "girl"=>1,
        "quit"=>1, 
        "playing"=>1,
        "we're"=>1, 
        "friends"=>1,
        "what"=>1, 
        "saying"=>2, 
        "say"=>1, 
        "there's"=>1,
        "another"=>1, 
        "look"=>1, 
        "right"=>1, 
        "in"=>3, 
        "eyes"=>1, 
        "first"=>4,
        "broke"=>1, 
        "for"=>2,
        "the"=>4, 
        "time"=>1,
        "was"=>5, 
        "like"=>14, 
        "baby"=>56, 
        "oooh"=>12, 
        "nooo"=>6, 
        "thought"=>6, 
        "you'd"=>6, 
        "always"=>6, 
        "mine"=>12, 
        "oh"=>2, 
        "have"=>1, 
        "done"=>1, 
        "whatever"=>1, 
        "can't"=>2, 
        "believe"=>2, 
        "ain't"=>1, 
        "together"=>1, 
        "wanna"=>2, 
        "play"=>1, 
        "it"=>2, 
        "cool"=>1, 
        "but"=>3, 
        "i'm"=>9, 
        "losin'"=>1, 
        "buy"=>2, 
        "anything"=>1,
        "any"=>1, 
        "ring"=>1,
        "pieces"=>1, 
        "fix"=>1, 
        "shake"=>1, 
        "'til"=>1, 
        "wake"=>1, 
        "from"=>1, 
        "this"=>1, 
        "bad"=>1, 
        "dream"=>1, 
        "going"=>2, 
        "down"=>4, 
        "won't"=>1, 
        "around"=>1, 
        "luda!"=>1, 
        "when"=>2, 
        "13"=>1, 
        "had"=>2, 
        "nobody"=>2, 
        "that"=>1, 
        "compared"=>1, 
        "to"=>1, 
        "came"=>1, 
        "between"=>1, 
        "us"=>1, 
        "or"=>1, 
        "could"=>1, 
        "come"=>1, 
        "above"=>1, 
        "she"=>6, 
        "crazy"=>1, 
        "star-struck"=>1, 
        "woke"=>1, 
        "up"=>1, 
        "daily"=>1, 
        "don't"=>1, 
        "need"=>1, "no"=>1,
        "starbucks"=>1, 
        "made"=>1, 
        "pound"=>1, 
        "skipped"=>1, 
        "a"=>1, 
        "beat"=>1, 
        "see"=>2, 
        "her"=>2,
        "street"=>1, 
        "at"=>1, 
        "school"=>1, 
        "on"=>3, 
        "playground"=>1, 
        "really"=>1, 
        "weekend"=>1, 
        "knows"=>1, 
        "got"=>1, 
        "dazing"=>1, 
        "cause"=>1, 
        "so"=>1, 
        "amazing"=>1, 
        "now"=>4, 
        "is"=>1, 
        "breaking"=>1, 
        "keep"=>1, 
        "gone"=>8, 
        "yeah"=>18, 
        "all"=>3
      }
      expect(WordCounter.count(lyrics)).to eq expected
    end
    
  end
end