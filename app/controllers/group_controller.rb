class GroupController < ApplicationController
  before_action :check_authorization, only: [:post, :put, :delete]
  before_action :check_permission, only: [:put, :delete]
  before_action :set_group, only: [:get, :put, :delete]

  def get
    render json: @group
  end

  def post
    params[:group][:user_id] = session[:me]
    group = Group.create(params.require(:group).permit([:user_id, :name, :description]))

    if !group.id.nil?
      render json: group
    else
      render json: { error: group.errors.messages }, status: :bad_request
    end
  end

  def put
    @group.update(params.require(:group).permit([:name, :description]))
    render json: @group
  end

  def delete
    @group.destroy
    render nothing: true
  end

  private

  def check_permission
    group = Group.find(params[:id])
    render nothing: true, status: :forbidden if group.user_id != session[:me]
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
