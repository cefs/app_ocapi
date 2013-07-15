require 'spec_helper'

describe AdvertisingsController do
  before do
    sign_in :user, User.make!(:admin)
  end

  describe "GET #new" do
    it 'uses Pending as default value for status' do
      get :new

      expect(assigns(:advertising).status).to eq Status::PENDING
    end
  end

  describe "GET #edit" do
    it 'uses pending status for editing' do
      advertising = Advertising.make!(:anuncio_carro_aprovado, user: User.make!(:sr_carlos))

      get :edit, { id: advertising.id }

      expect(assigns(:advertising).status).to eq Status::PENDING
    end
  end
end
