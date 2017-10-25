require "csv"

class User

  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def perform_routine_for(user)
    jokes.map do |joke|
      user.jokes << joke
    end
  end

  def learn_routine(csv)
    jokes =  CSV.open csv, headers: true
    add_jokes(jokes)
  end

  def add_jokes(jokes)
    jokes.map {|joke| @jokes << joke}
  end
end
