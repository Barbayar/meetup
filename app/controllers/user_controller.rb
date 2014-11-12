class UserController < ApplicationController
  AUTH_SERVICES = {
    'facebook' => 1,
    'twitter' => 2
  }

  def signin
    credential = request.env['omniauth.auth']
    new_user = {
      :sid => AUTH_SERVICES[credential[:provider]],
      :uid => credential[:uid].to_i,
      :name => credential[:info][:name],
      :email => credential[:info][:email],
      :avatar_url => credential[:info][:image],
    }

    user = User.find_by(sid: new_user[:sid], uid: new_user[:uid])

    if user.nil?
      logger.info 'creating user...'
      user = User.create(new_user)
    else
      logger.info 'updating user...'
      user.update(new_user)
    end

    session[:me] = user.attributes
    render nothing: true
  end

  def signout
    session[:me] = nil
    render nothing: true
  end
end
