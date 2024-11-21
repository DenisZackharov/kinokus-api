puts "Creating movies..."

green_mile = Movie.find_or_create_by!(name: "Green Kus", description: "The Green Meow is a 1999 American fantasy crime drama.")
kill_bill = Movie.find_or_create_by!(name: "Kill Meow", description: "Meowtin Kisrantino film.")
pulp_fiction = Movie.find_or_create_by!(name: "Pulp Kiss", description: "Most popular Meowtin Kisrantino film.")

puts "Movies created!"
