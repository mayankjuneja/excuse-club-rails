class Api::ExcusesController < ApplicationController
  def create
    @excuse = current_user.excuses.build(excuse_params)
    if @excuse.save
      render json: @excuse
    else
      render json: { errors: @excuse.errors.full_messages }
    end
  end

  private

  def excuse_params
    params.permit(:start_time, :end_time)
  end
end
