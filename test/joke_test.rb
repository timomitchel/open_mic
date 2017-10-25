require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  def test_joke_attributes_return_correctly
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    question = "Why did the strawberry cross the road?"
    answer = "Because his mother was in a jam."

    assert_equal 1, joke.id
    assert_equal question, joke.question
    assert_equal answer, joke.answer
  end


end
