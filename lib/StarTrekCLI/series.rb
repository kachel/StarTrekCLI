require "pry"
require "byebug"

class Series
  attr_accessor :name

  @@all = []

  def initialize(name=nil)
    @name = name
  end

  def self.all
    @@all
  end


end
