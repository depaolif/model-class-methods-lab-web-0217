require 'pry'

class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.longest_boat
    self.find_by(length: self.maximum(:length))
  end

  def self.first_five
  	self.limit(5)
  end

  def self.dinghy
  	self.where("length < 20")
  end

  def self.ship
  	self.where("length >= 20")
  end

  def self.last_three_alphabetically
  	self.order("name DESC").limit(3)
  end

  def self.without_a_captain
  	self.where("captain_id IS NULL")
  end

  def self.sailboats
  	self.joins(:classifications).where(classifications: {name: "Sailboat"})
  end

  def self.with_three_classifications
  	self.joins(:boat_classifications).group(:boat_id).having("COUNT('boat_id') = 3")
  end
end
