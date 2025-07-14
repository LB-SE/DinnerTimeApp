class Recipe < ApplicationRecord
	# Search the Recipes database for a recipe with a set of params
	# NB: I would add further features to search different categories based on input
	# But this simple search for ingredients will do for now
	# @params [String] - Search query for the recipes
	# @return [array(recipe)]
	def self.search(params)
		return unless params[:q].present?

		# Split the search query if multiple ingredients preset
		ingredients = params[:q].tr(',', ' ').split(" ")
		# Ensure array
		ingredients = [ingredients] unless ingredients.is_a?(Array)

		conditions = ingredients.map { "ingredients LIKE ?" }.join(" AND ")
		ingredients_wildcard = ingredients.map { |name| "%#{name}%"}

		#Recipe.where("ingredients LIKE ?", "%#{params[:q]}%")

		Recipe.where(conditions, *ingredients_wildcard)
	end
end
