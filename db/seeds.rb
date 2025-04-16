Book.create(title: "Night", author: "Elie Wiesel", genre: "Autobiography", description: "Elie Wiesel recounts his story of surviving life in a concentration camp during the Holocaust in his memoir, Night.", pages: 120)
Book.create(title: "The Scarlet Letter", author: "Nathaniel Hawthorne", genre: "Historical Fiction", description: "A woman struggles with raising her daughter in a life shunned by society after the town accuses her of adultery.", pages: 288)
Book.create(title: "The Giver", author: "Lois Lowry", genre: "Science Fiction", description: "Novel about a dystopian society in the guise of utopia. Jonas has come of age and is chosen to be the next Receiver of Memory, and discovers the painful and beautiful truths of his community's past.", pages: 240)

Meeting.create(date: "March 3, 2025", time: "2:00 pm", genre: "Autobiography", selected_book: "Night")
Meeting.create(date: "March 3, 2025", time: "5:00 pm", genre: "Historical Fiction", selected_book: "The Scarlet Letter")
Meeting.create(date: "March 5, 2025", time: "2:00 pm", genre: "Science Fiction", selected_book: "The Giver")

User.create(name: "Jim", email: "jim@mail.com", password: "jimpass")
User.create(name: "Jane", email: "jane@mail.com", password: "janepass")
User.create(name: "John", email: "john@mail.com", password: "johnpass")

Recommendation.create(user_id: 1, title: "Night", author: "Elie Wiesel", rating: 5, review: "This novel changed my life! It is not only educational, but enlightening as well! It truly tugs on your heart strings.")
Recommendation.create(user_id: 2, title: "The Giver", author: "Lois Lowry", rating: 5, review: "I love how the ending is open ended for the reader to interpret!")
Recommendation.create(user_id: 3, title: "The Scarlet Letter", author: "Nathaniel Hawthorne", rating: 5, review: "The plot twist was crazy!!!!!")
