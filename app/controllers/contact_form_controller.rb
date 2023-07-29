# frozen_string_literal: true

# app/controllers/ContactFormController
class ContactFormController < ApplicationController
  def create
    @name = params[:contact_form][:name]
    @last_name = params[:contact_form][:last_name]
    @email = params[:contact_form][:email]
    @message = params[:contact_form][:message]

    send_email
    flash[:success] = 'Your message has been sent successfully.'
    redirect_to :root
  end

  def send_email
    NotifierMailer.simple_message(@name, @last_name, @email, @message).deliver_now
  end
end
