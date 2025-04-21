class UsersController < ApplicationController
  before_action :authorize_request, only: [:me] #[:update, :destroy]

  def index
    # users = policy_scope(User)
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user.as_json(include: :recommendations)
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation] #,
      # role: params[:role]
    )
    if user.save!
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    user = User.find(params[:id])
    # authorize user

    if user.update(
      name: params[:name] || user.name,
      email: params[:email] || user.email,
      # password: params[:password] || user.password
    )
      render json: user
    else
      render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    
    # authorize user
    
    user.destroy
    render json: { message: 'User removed from Book Club' }, status: :ok
  end

  def me
    render json: @current_user, status: :ok
  end
end
