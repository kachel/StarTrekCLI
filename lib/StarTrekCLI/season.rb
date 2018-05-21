require 'pry'
require 'byebug'

class Season
  attr_reader :number, :episodes

  def initialize(number = nil)
    @number = number
    @episodes = []
  end
end
