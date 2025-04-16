class Api::V1::RecommendationsController < ApplicationController
  # before_action :authorize_request, except: [:index]
  before_action :set_user

  def index
    # recommendations = policy_scope(Recommendation)
    # recommendations = Recommendation.all
    recommendations = @user.recommendations
    render json: recommendations
  end

  def show
    recommendation =@user.reviews.find(params[:id])
    render json: recommendation
  end

  def create
    recommendation = @user.recommendations.new(
      user_id: @user.id,
      title: params[:title],
      author: params[:author],
      rating: params[:rating],
      review: params[:review]
    )
    # recommendation = Recommendation.new(
    #   title: params[:title],
    #   author: params[:author],
    #   review: params[:review],
    #   user_id: current_user.id
    # )
    # authorize recommendation

    if recommendation.save
      puts "--------"
      puts recommendation.user_id
      puts "--------"
      render json: recommendation, status: :created
    else 
      render json: { errors: recommendation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    recommendation = @user.recommendations.find(params[:id])
    # recommendation = Recommendation.find(params[:id])
    # authorize recommendation

    if recommendation.update(
      title: params[:title] || recommendation.title,
      author: params[:author] || recommendation.author,
      rating: params[:rating] || recommendation.rating,
      review: params[:review] || recommendation.review
    )
      render json: recommendation
    else
      render json: {errors: recommendation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    recommendation = @user.recommendations.find(params[:id])
    # recommendation = Recommendation.find(params[:id])
    # authorize recommendation
    
    recommendation.destroy
    render json: { message: 'Recommendation removed from Forum' }, status: :ok
    # render recommendations
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
