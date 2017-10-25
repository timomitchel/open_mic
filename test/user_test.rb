require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require "./lib/joke"

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

  def test_user_can_tell_other_user_jokes
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    answer = "Because his mother was in a jam."
    
    sal.tell(ali, joke)

    assert_equal 1, ali.jokes.first.id
    assert_equal answer, ali.jokes[0].answer
    assert_equal 1, ali.jokes.count
  end

  def test_user_can_perform_for_other_user
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    ilana = User.new("Ilana")
    josh = User.new("Josh")

    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.perform_routine_for(josh)

    assert_instance_of Array, josh.jokes
    assert_equal 2, josh.jokes.count
  end

  def test_user_can_learn_routine
    casey = User.new("Casey")
    casey.learn_routine('./jokes.csv')

    assert_equal 100, casey.jokes.count
  end
end
