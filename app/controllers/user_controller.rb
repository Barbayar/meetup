class UserController < ApplicationController
  AUTH_SERVICES = {
    'facebook' => 1,
    'twitter' => 2
  }

  def signin
    credential = request.env['omniauth.auth']
    user = {
      :sid => AUTH_SERVICES[credential[:provider]],
      :uid => credential[:uid].to_i,
      :name => credential[:info][:name],
      :email => credential[:info][:email],
      :avatar_url => credential[:info][:image],
    }

    User.create(user) if User.find_by(sid: user[:sid], uid: user[:uid]).nil?
    session[:me] = user

    respond_to do |format|
      format.any { render nothing: true }
    end
  end

  def signout
    session[:me] = nil

    respond_to do |format|
      format.any { render nothing: true }
    end
  end
end
