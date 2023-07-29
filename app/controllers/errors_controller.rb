# frozen_string_literal: true

class ErrorsController < ApplicationController
  def not_found
    render 'errors/404', status: 404
  end

  def internal_server_error
    render 'errors/500', status: 500
  end
end
