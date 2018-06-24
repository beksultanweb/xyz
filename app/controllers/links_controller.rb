class LinksController < ApplicationController
  
  def index
  	@links = Link.all
  	@links = Link.paginate(page: params[:page])
  end

  def create
  	@link = Link.new(link_params)
  	respond_to do |format|
	  	if @link.save
	  			format.html {}
	  			format.js {}
	  	else
	  			format.html {}
	  			format.js {render "error" }
	  	end
	  end
  end

  def redirect
  	l = Link.find_by_short(params[:id])
  	
  	l.update_attribute(:count, l.count + 1)
  	redirect_to l.url
  end

  private
  def link_params
  	params.require(:link).permit(:url)
  end

end
