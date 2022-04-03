# frozen_string_literal: true

# initializes players with name and token
class Player
  attr_accessor :name, :token

  def initialize(name, token)
    @name = name
    @token = token
  end
end
