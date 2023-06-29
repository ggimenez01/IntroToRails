require 'csv'
require 'faker'

# Import data from dog_breeds.csv
csv_text = File.read('db/dog_breeds.csv')
csv = CSV.parse(csv_text, headers: true)

csv.each do |row|
  Breed.create(
    name: row['breed_name'],
    group: row['group'],
    section: row['section'],
    country: row['country'],
    url: row['url'],
    image: row['image'],
    pdf: row['pdf'],
    description: Faker::Lorem.paragraph
  )
end

# Generate Faker data for Owners and Dogs
10.times do
  owner = Owner.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )

  2.times do
    dog = Dog.create(
      name: Faker::Creature::Dog.name,
      age: rand(1..15),
      breed: Breed.all.sample,
      owner: owner
    )
  end
end

# Generate Faker data for VetVisits
dogs = Dog.all

10.times do
  dog = dogs.sample

  vet_visit = VetVisit.new(
    visit_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    description: Faker::Lorem.sentence
  )
  vet_visit.dog = dog  # Associate the vet visit with a dog
  vet_visit.save  # Save the vet visit record

  # Display any validation errors, if present
  puts vet_visit.errors.full_messages if vet_visit.errors.any?
end
