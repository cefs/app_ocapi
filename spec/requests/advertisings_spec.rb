# encoding: utf-8
require 'spec_helper'

feature "Advertisings" do
  let(:current_user) { User.make!(:admin) }

  background do
    login_as current_user, scope: :user

    visit root_path
  end

  scenario 'create advertising' do
      expect(page).to have_content 'Anúncios Recentes'

      click_link 'Cadastrar Anúncio'

      expect(page).to have_content 'Cadastrar Anúncio'

      expect(page).to have_field 'Status', with: 'pending'

      fill_in 'Título', with: 'Meu título'
      fill_in 'Descrição', with: 'Minha descrição'
      fill_in 'Status', with: 'pending'

      click_button 'Criar Anúncio'

      expect(page).to have_content 'Criado com sucesso!'

      expect(page).to have_field 'Título', with: 'Meu título'
      expect(page).to have_field 'Descrição', with: 'Minha descrição'
      expect(page).to have_field 'Status', with: 'pending'
  end
end
