class SessionsController < ApplicationController
  skip_before_action :require_login, except: :logout

  def login_page
    if session[:user_id]
      redirect_to home_path
    end
  end

  def login
    if (params[:username] != "" && params[:password] != "")
      user = User.authenticate(params[:username], params[:password])
    end
    if user
      session[:user_id] = user.id
      redirect_to
    else
#      redirect_to action: :login_page
      redirect_to action: :login_page_error
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to action: :login_page
  end

  def signup
    if (params[:name] != "" && params[:username] != "" && params[:password] != "" && params[:cpassword] != "")
      user = User.create_user(params[:name], params[:username], params[:password], params[:cpassword])
    end
    if user
      redirect_to action: :login
    else
#      redirect_to action: :signup
      redirect_to action: :signup_page_error
    end
  end
end
