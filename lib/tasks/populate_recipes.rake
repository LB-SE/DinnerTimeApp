
namespace :populate do
	# Populate the recipes database with an external JSON recipes file
	# @params file_name [String] - The name and location of the file to parse
	# @return void
	task :recipes, [:file_name] => :environment do |t, args|
		recipes_text_file = File.read(args[:file_name])
		JSON.parse(recipes_text_file).each do |recipe_text|
			Recipe.create(title: recipe_text["title"],
				cook_time: recipe_text["cook_time"],
				prep_time: recipe_text["prep_time"],
				ingredients: recipe_text["ingredients"].each { |ingredient| },
				ratings: recipe_text["ratings"],
				cuisine: recipe_text["cuisine"],
				category: recipe_text["category"],
				author: recipe_text["author"],
				image: recipe_text["image"]
				)
		end
	end
end