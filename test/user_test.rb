require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_jokes_starts_empty
    ali = User.new("Ali")

    assert_equal [], ali.jokes
  end

  def test_can_pass_user_jokes
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    question = "Why did the strawberry cross the road?"

    ali.learn(joke)

    assert_instance_of Array, ali.jokes
    assert_instance_of Joke, ali.jokes[0]
    assert_equal 1, ali.jokes.first.id
    assert_equal question, ali.jokes.first.question
  end
end
