# encoding: utf-8
require 'spec_helper'

feature 'Users' do
  background do
    visit root_path
  end

  scenario 'create a new user' do
    click_link 'Cadastre-se'

    have_content 'Cadastre-se'

    fill_in 'E-mail', with: 'admin@appocapi.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirme a senha', with: '12345678'

    click_button 'Sign up'

    expect(page).to have_content 'Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail.'
  end
end

