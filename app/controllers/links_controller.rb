class LinksController < ApplicationController

  def show
    @link = Link.find_by(id: params[:id])

    # if no such link exists. Then user is probably trying to access their shortened website
    # check for submitted slug and redirect to the link url
    unless @link
      @link = Link.find_by(slug: params[:slug])
      @link.update_attribute(:clicked, @link.clicked + 1)
      redirect_to @link.url
    end
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
