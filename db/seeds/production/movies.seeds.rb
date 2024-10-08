puts "Creating movies..."

green_mile = Movie.find_or_create_by!(name: "Green Mile", description: "The Green Mile is a 1999 American fantasy crime drama.")
kill_bill = Movie.find_or_create_by!(name: "Kill Bill", description: "Quentin Tarantino film.")
pulp_fiction = Movie.find_or_create_by!(name: "Pulp Fiction", description: "Most popular Quentin Tarantino film.")

pulp_fiction_url = "https://m.media-amazon.com/images/M/MV5BYTViYTE3ZGQtNDBlMC00ZTAyLTkyODMtZGRiZDg0MjA2YThkXkEyXkFqcGc@._V1_.jpg"
pulp_fiction_file = URI.parse(pulp_fiction_url).open

green_mile_url = "https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_FMjpg_UX1000_.jpg"
green_mile_file = URI.parse(green_mile_url).open

kill_bill_url = "https://m.media-amazon.com/images/M/MV5BZmMyYzJlZmYtY2I3NC00NjAyLTkyZWItZjdjZDI1YTYyYTEwXkEyXkFqcGc@._V1_.jpg"
kill_bill_file = URI.parse(kill_bill_url).open


green_mile.poster.attach(io: green_mile_file, filename: "green_mile.jpg") unless green_mile.poster.attached?
kill_bill.poster.attach(io: kill_bill_file, filename: "kill_bill.jpg") unless kill_bill.poster.attached?
pulp_fiction.poster.attach(io: pulp_fiction_file, filename: "pulp_fiction.png") unless pulp_fiction.poster.attached?

puts "Movies created!"
