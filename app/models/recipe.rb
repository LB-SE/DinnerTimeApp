class Recipe < ApplicationRecord
	# Search the Recipes database for a recipe with a set of params
	# NB: I would add further features to search different categories based on input
	# But this simple search for ingredients will do for now
	# @params [String] - Search query for the recipes
	# @return [array(recipe)]
	def self.search(params)
		return unless params[:q].present?

		Recipe.where("ingredients LIKE ?", "%#{params[:q]}%")
	end
end
