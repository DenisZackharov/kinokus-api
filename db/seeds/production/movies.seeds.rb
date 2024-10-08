puts "Creating movies..."

green_mile = Movie.find_or_create_by!(name: "Green Mile", description: "The Green Mile is a 1999 American fantasy crime drama.")
kill_bill = Movie.find_or_create_by!(name: "Kill Bill", description: "Quentin Tarantino film.")
pulp_fiction = Movie.find_or_create_by!(name: "Pulp Fiction", description: "Most popular Quentin Tarantino film.")

green_mile.poster.attach(io: File.open(Rails.root.join("spec/fixtures/green_mile.jpg")), filename: "green_mile.jpg")
kill_bill.poster.attach(io: File.open(Rails.root.join("spec/fixtures/kill_bill.jpg")), filename: "kill_bill.jpg")
pulp_fiction.poster.attach(io: File.open(Rails.root.join("spec/fixtures/pulp_fiction.png")), filename: "pulp_fiction.png")

puts "Movies created!"
