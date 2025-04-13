class Api::V1::RecommendationsController < ApplicationController
  # before_action :authorize_request, except: [:index]

  def index
    # recommendations = policy_scope(Recommendation)
    recommendations = Recommendation.all
    render json: recommendations
  end

  def create
    recommendation = Recommendation.new(
      title: params[:title],
      author: params[:author],
      review: params[:review],
      user_id: current_user.id
    )
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
    recommendation = Recommendation.find(params[:id])
    # authorize recommendation

    if recommendation.update(
      title: params[:title] || recommendation.title,
      author: params[:author] || recommendation.author,
      review: params[:review] || recommendation.review
    )
      render json: recommendation
    else
      render json: {errors: recommendation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    recommendation = Recommendation.find(params[:id])
    # authorize recommendation
    
    recommendation.destroy
    render json: { message: 'Recommendation removed from Forum' }, status: :ok
  end

end
