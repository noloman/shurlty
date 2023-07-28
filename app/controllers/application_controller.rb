# app/controllers/application_controller
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::

  private

  def record_not_found
    redirect_to '/errors#not_found'
  end
end
