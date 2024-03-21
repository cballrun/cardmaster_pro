# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

variant_seed_search_terms = [
    "Bulbasaur",
    "Ivysaur",
    "Venusaur"
]

    # "Charmander",
    # "Charmeleon",
    # "Charizard",
    # "Squirtle",
    # "Wartortle", 
    # "Blastoise",
    # "Caterpie",
    # "Metapod",
    # "Butterfree",
    # "Weedle",
    # "Kakuna",
    # "Beedrill",
    # "Pidgey",
    # "Pidgeotto",
    # "Pidgeot"

variant_seed_search_terms.each do |search_term|
    VariantsFacade.create_variants_by_search_term(search_term)
end