# frozen_string_literal: true

# Userを追加

10.times do |num|
  User.create!(
    name: "test_user#{num}",
    email: "test#{num}@example.com",
    password: "test_password#{num}"
  )
  Item.create!(
    name: "test_item#{num}",
    stocks: 1 + num,
    price: 1000 + num,
    description: "test_description#{num}",
    hide: 1
  )
  Category.create!(
    name: "test_category#{num}"
  )
end

User.create!(
  name: "admin",
  email: "admin@admin.com",
  password: "test_admin",
  admin: 1
)

ItemReview.create!(
  review: "test_review",
  item_id: 1
)
