class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
  	self.joins(boats: :classifications).where(classifications: {name: 'Catamaran'})
  end
  
  def self.sailors
  	self.joins(boats: :classifications).where(classifications: {name: 'Sailboat'}).uniq
  end

  def self.talented_seamen
  	sailors = self.joins(boats: :classifications).where(classifications: {name: 'Sailboat'}).uniq
  	motors = self.joins(boats: :classifications).where(classifications: {name: 'Motorboat'}).uniq
  	self.where(id: sailors&motors)
  end

  def self.non_sailors
  	self.where.not(name: self.sailors.pluck('name'))
  end

end
