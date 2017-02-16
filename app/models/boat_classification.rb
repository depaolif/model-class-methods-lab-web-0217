class BoatClassification < ActiveRecord::Base
  belongs_to :boat
  belongs_to :classification
	def self.longest_boat_cats
		self.where(boat_id: Boat.longest_boat)
	end
end
