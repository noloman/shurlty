class LinksController < ApplicationController
  def show
    link = Link.find_by_slug(params[:slug])
    redirect_to link.url, allow_other_host: true
  end
end
