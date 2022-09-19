Book.create!([
  {title: "Harry Potter", author: "JK Rowling", price: "10.0", published_date: "2022-09-19"},
  {title: "The life of a turtle", author: "Sally Mae", price: "12.0", published_date: "2022-09-19"},
  {title: "The mirror, the lion, and the audacity of the little dog", author: "Susy Q", price: "12.0", published_date: "2022-09-19"},
  {title: "Origami for cats", author: "Kitty Kat", price: "6.0", published_date: "2022-09-19"},
  {title: "The weight of a hundred kilograms", author: "Bill Science", price: "20.0", published_date: "2022-09-19"}
])
User.create!([
  {username: "daperego"}
])
UserBook.create!([
  {user_id: 1, book_id: 1}
])
