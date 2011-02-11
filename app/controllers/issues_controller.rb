class IssuesController < ApplicationController

before_filter :authenticate, :only => [:create, :destroy]
before_filter :authorized_user, :only => :destroy



	def create
    @issue  = current_user.issues.build(params[:issue])
    if @issue.save
      flash[:success] = "Issue created!"
      redirect_to root_path
	else
      @feed_items = []
      render 'pages/home'
    end
  end


	def destroy
    @issue.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @issue = Issue.find(params[:id])
      redirect_to root_path unless current_user?(@issue.user)
    end

end
