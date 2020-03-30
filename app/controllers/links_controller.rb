class LinksController < ApplicationController

  def show
    @link = Link.find(params[:id])
    #@link.short
    #render 'errors/404', status: 404 if @link.nil?
    #@link.update_attribute(:clicked, @link.clicked + 1)
    #redirect_to @link.url
  end

  def new
    @link = Link.new()
   # @link.save
  end

  def create
    
    @link = Link.new(link_params)

    if @link.save
      redirect_to @link
    else
      render 'new'
    end

  end 

  private

  def link_params
    params.require(:link).permit(:url, :slug )
  end
end
