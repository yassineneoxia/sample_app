class PagesController < ApplicationController
   def home
    @title = "Home"
	if signed_in?
      @issue = Issue.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

   def title
    @title = "Sample App"
  end

end
