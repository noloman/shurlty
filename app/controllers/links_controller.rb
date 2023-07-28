class LinksController < ApplicationController
  def show
    link = Link.find_by_slug(params[:slug])
    if link.nil?
      render :file => 'public/404.html', status => :not_found, :layout => false
    else
      redirect_to link.url, allow_other_host: true
    end
  end
end
