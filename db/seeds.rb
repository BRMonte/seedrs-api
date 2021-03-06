Campaign.destroy_all

40.times do |index|
  Campaign.create!(
                name: Faker::Company.name,
                sector: Faker::Company.industry,
                country: Faker::Address.country,
                target_amount: Faker::Number.number(digits: 6),
                investment_multiple: Faker::Number.decimal(l_digits: 3, r_digits: 2),
                percentage_raised: '0'
                )
end

p "Created #{Campaign.count} campaigns"
