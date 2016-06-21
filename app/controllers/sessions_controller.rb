class SessionsController < ApplicationController
  def new
  end

  def create
    # finds the user in the db using the submitted email address
    user = User.find_by(email: params[:session][:email].downcase)
    # determine if the resulting user's email and password are valid (exist in the db)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination."
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
