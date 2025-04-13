class Api::V1::BooksController < ApplicationController
  # before_action :authorize_request, only: [:create, :update, :destroy]

  def index
    # books = policy_scope(Book)
    books = Book.all
    render json: books
  end
  
  def show
    book = Book.find(params[:id])
    # authorize book

    render json: book
  end

  def create
    book = Book.new(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      description: params[:description],
      pages: params[:pages]
    )
    # authorize book
    if book.save
      user_book = UserBook.create(user_id: 1)
      # user_book = UserBook.create(user_id: current_user.id, book_id: book.id)
      puts "--------"
      puts "user_book.user_id"
      puts "--------"
      puts "user_book.book_id"
      puts "--------"
      render json: book, status: :created
    else 
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    book = Book.find(params[:id])
    # authorize book

    if book.update(
      title: params[:title] || book.title,
      author: params[:author] || book.author,
      genre: params[:genre] || book.genre,
      description: params[:description] || book.description,
      pages: params[:pages] || book.pages
    )
      render json: book
    else
      render json: {errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    # authorize book
    
    book.destroy
    render json: { message: 'Book removed from Library' }, status: :ok
  end

end
