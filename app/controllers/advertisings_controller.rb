# encoding: utf-8
class AdvertisingsController < InheritedResources::Base
  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @advertising = build_resource
    @advertising.status = Status::PENDING
  end

  def create
    @advertising = Advertising.new(params[:advertising])
    @advertising.user_id = current_user.id

    create!
  end

  def edit
    @advertising = Advertising.find(params[:id])
    @advertising.status = Status::PENDING

    unless @advertising.user == current_user
      redirect_to root_path, notice: 'Você não tem permissão!'
    end
  end

  def destroy
    @advertising = Advertising.find(params[:id])

    unless @advertising.user == current_user
      redirect_to root_path, notice: 'Você não tem permissão!'
    else
      destroy!
    end
  end
end
