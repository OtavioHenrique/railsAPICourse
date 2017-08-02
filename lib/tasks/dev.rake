namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    %x(rails db:drop db:create db:migrate)

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    100.times do |t|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(23.years.ago, 15.years.ago),
        kind: Kind.all.sample
      )
    end

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create(
          number: Faker::PhoneNumber.cell_phone
        )
        contact.phones << phone
        contact.save!
      end
    end

    Contact.all.each do |contact|
      contact.address = Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact,
      )
      contact.save!
    end
  end
end
