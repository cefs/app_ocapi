# encoding: utf-8
class AdvertisingsController < InheritedResources::Base
  before_filter :authenticate_user!, except: [:index, :show]
  respond_to :json, only: :index

  def index
    @advertisings = Advertising.approved
  end

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

  protected

  def create_resource(object)
    object.transaction do
      object.status = Status::PENDING

      super
    end
  end

  def update_resource(object, attributes)
    object.transaction do
      object.status = Status::PENDING

      super
    end
  end
end
