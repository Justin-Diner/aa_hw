require 'action_view'

class Cat < ApplicationRecord
include ActionView::Helpers::DateHelper

	CAT_COLORS = ["orange", "grey", "black", "white", "brown"].freeze

	validates :birth_date, :name, presence: true
	validates :color, inclusion: CAT_COLORS
	validates :sex, inclusion: %w[M F]
	validate :birth_date_cannot_be_future 

	def birth_date_cannot_be_future 
		if birth_date.present? && ((birth_date <=> Date.today) > 0)
			return errors.add(:birth_date, "cat born in future")
		end
	end

	def age 
		time_ago_in_words(birth_date)
	end
end
