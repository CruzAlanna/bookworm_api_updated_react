class User < ApplicationRecord
  has_secure_password
  has_many :user_books, dependent: :destroy
  has_many :books, through: :user_books
  has_many :recommendations, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  # validates :password, presence: true
  # validates :role, inclusion: { in: %w[user librarian admin], message: "%{value} is not a valid role" }

  # def admin?
  #   role == 'admin'
  # end

  # def user?
  #   role == 'user'
  # end

  # def librarian?
  #   role == 'librarian'
  # end
end

#user- all people that utilize the platform.

#librarian- the employees that work to fix bugs and monitor the platform for any inappropriate activity, handle any reported material. They are also in charge of scheduling meetings for the users of the platform to meet up and chat, similar to an online "book club meeting".

#admin- the big bosses, hire the "librarians".
