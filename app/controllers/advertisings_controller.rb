# encoding: utf-8
class AdvertisingsController < InheritedResources::Base
  before_filter :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource
  respond_to :json, only: :index

  def index
    if user_signed_in? && current_user.role == 'admin'
      @advertisings = Advertising.order { created_at.desc }.page(params[:page]).per(5)
    else
      @advertisings = Advertising.approved.page(params[:page]).per(5)
    end
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
      redirect_to root_path, notice: 'você não tem permissão!'
    end
  end

  def destroy
    @advertising = Advertising.find(params[:id])

    if current_user.role == 'admin' || @advertising.user == current_user
      destroy! do |success, failure|
        success.html { redirect_to root_path, notice: 'Apagado com sucesso!' }
      end
    else
      redirect_to root_path, notice: 'Você não tem permissão!'
    end
  end

  def approved
    advertising = Advertising.find(params[:id])

    if advertising.update_attribute :status, Status::APPROVED
      flash[:notice] = 'O anúncio foi aprovado.'
    end

    redirect_to root_path
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
