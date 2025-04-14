class Api::V1::MeetingsController < ApplicationController
  # before_action :authorize_request, except: [:index, :show]

  def index
    # meetings = policy_scope(Meeting)
    meetings = Meeting.all
    render json: meetings
  end

  def show
    meeting = Meeting.find(params[:id])
    # authorize meeting
    
    render json: meeting
  end

  def create
    meeting = Meeting.new(
      date: params[:date],
      time: params[:time],
      selected_book: params[:selected_book],
      genre: params[:genre]
    )
    # authorize meeting

    if meeting.save
      render json: meeting, status: :created
    else 
      render json: { errors: meeting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    meeting = Meeting.find(params[:id])
    # authorize meeting

    if meeting.update(
      date: params[:date] || meeting.date,
      time: params[:time] || meeting.time,
      selected_book: params[:selected_book] || meeting.selected_book,
      genre: params[:genre] || meeting.genre
    )
      render json: meeting
    else
      render json: {errors: meeting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    meeting = Meeting.find(params[:id])
    # authorize meeting
    
    meeting.destroy
    render json: { message: 'Meeting removed from Schedule' }, status: :ok
  end
end
