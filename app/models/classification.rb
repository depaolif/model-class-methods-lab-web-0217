class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
  	self.all.uniq
  end

  def self.longest
  	self.where("id IN (?)", BoatClassification.longest_boat_cats.pluck(:classification_id))
  end
end
