class Api::V1::ReportsController < ApplicationController
  # before_action :authorize_request, except: [:create]

  def index
    # reports = policy_scope(Report)
    reports = Report.all
    render json: reports
  end

  def show
    report = Report.find(params[:id])
    # authorize report
    
    render json: report
  end

  def create
    report = Report.new(
      issue: params[:issue]
    )

    if report.save
      render json: report, status: :created
    else 
      render json: { errors: report.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    report = Report.find(params[:id])
    # authorize report
    
    report.destroy
    render json: { message: 'Report removed from Record' }, status: :ok
  end

  def resolve
    report = Report.find(params[:id])
    # authorize report

    report.update(resolved: 'true')
    render json: { message: 'Issue marked as resolved.' }, status: :ok
  end
end
