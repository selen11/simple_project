Card.delete_all

5.times do
  Card.create(
    original_text: Faker::Lorem.paragraph,
    translated_text: Faker::Lorem.paragraph,
    review_date: Faker::Time.between(2.days.ago, Time.now)
  )
end
