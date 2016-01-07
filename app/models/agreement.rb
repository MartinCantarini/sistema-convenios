class Agreement < ActiveRecord::Base
	has_many :signatures, :dependent => :destroy
	#has_many :tracings, :dependent => :destroy
	belongs_to :typeagreements
end
