# frozen_string_literal: true

# app/controllers/LinksController
class LinksController < ApplicationController
  def show
    @link = Link.find_by_slug(params[:slug])
    render 'show'
  end

  def create
    @link = Link.find_by_url(params[:url])
    if @link.nil?
      create_link
    else
      # the URL is already in the DB
      redirect_to short_url(@link.slug)
    end
  end

  private

  def create_link
    # there's no URL yet in the DB
    @link = Link.new
    @link.url = params[:url]
    @link.slug = @link.generate_slug
    if @link.valid?
      @link.save!
      flash[:notice] = 'Link successfully shortened'
      redirect_to short_url(@link.slug)
    else
      redirect_to root_path, alert: 'Error generating shortened link'
    end
  end
end
