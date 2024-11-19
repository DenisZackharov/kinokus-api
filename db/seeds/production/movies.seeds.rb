puts "Creating movies..."

green_mile = Movie.find_or_create_by!(name: "Green Mile", description: "The Green Mile is a 1999 American fantasy crime drama.")
kill_bill = Movie.find_or_create_by!(name: "Kill Bill", description: "Quentin Tarantino film.")
pulp_fiction = Movie.find_or_create_by!(name: "Pulp Fiction", description: "Most popular Quentin Tarantino film.")

test_url = "https://26601fec-9278-484e-9320-fb51eb6a5c97.selstorage.ru/photo_2024-11-18_18-03-47.jpg"
pulp_fiction_file = URI.parse(test_url).open

green_mile_file = URI.parse(test_url).open

kill_bill_file = URI.parse(test_url).open

green_mile.poster.attach(io: green_mile_file, filename: "green_mile.jpg") unless green_mile.poster.attached?
kill_bill.poster.attach(io: kill_bill_file, filename: "kill_bill.jpg") unless kill_bill.poster.attached?
pulp_fiction.poster.attach(io: pulp_fiction_file, filename: "pulp_fiction.png") unless pulp_fiction.poster.attached?

puts "Movies created!"
