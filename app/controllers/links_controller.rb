class LinksController < ApplicationController

  def show
    @link = Link.find_by_slug(params[:slug])
    render 'errors/404', status: 404 if @link.nil?
    @link.update_attribute(:clicked, @link.clicked + 1)
    redirect_to @link.url
  end

  def new
    @link = Link.new(link_params)
   # @link.save
  end

  def create
    
    @link = Link.create(link_params)

    if @link.save
      redirect_to @link_path(link)
    else
      render 'new'
    end

  end 

  private

  def link_params
    params.permit(:url, :slug)
  end
end
