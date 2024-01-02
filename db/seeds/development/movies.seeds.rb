Movie.destroy_all

puts "Creating movies..."

Movie.create!([
  { name: "Green Mile", description: "The Green Mile is a 1999 American fantasy crime drama film written and directed by Frank Darabont and based on Stephen King's 1996 novel of the same name. It stars Tom Hanks as a death row corrections officer during the U.S. Great Depression who witnesses supernatural events that occur after an enigmatic inmate (Michael Clarke Duncan) is brought to his facility. David Morse, Bonnie Hunt, Doug Hutchison and James Cromwell appear in supporting roles.", annotation: "The film received positive reviews from critics and was nominated for four Academy Awards: Best Picture, Best Supporting Actor for Duncan, Best Sound, and Best Adapted Screenplay. It also received four nominations at the 55th Golden Globe Awards: Best Motion Picture – Drama, Best Supporting Actor – Motion Picture for Duncan, Best Director for Darabont, and Best Screenplay for Darabont. The film grossed $290 million worldwide, making it Darabont's most profitable film to date." },
  { name: "Kill Bill", description: "Quentin Tarantino film" }
])

pulp_fiction = Movie.create!(name: "Pulp Fiction", description: "Most popular Quentin Tarantino film")
pulp_fiction.poster.attach(io: File.open(Rails.root.join("spec/fixtures/pulp_fiction.png")), filename: "pulp_fiction.png")

puts "Movies created!"
