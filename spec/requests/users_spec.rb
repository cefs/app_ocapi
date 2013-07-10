# encoding: utf-8
require 'spec_helper'

feature 'Users' do
  background do
    visit root_path
  end

  scenario 'create, edit e delete user' do
    expect(page).to have_link 'Cadastre-se'
    expect(page).to have_link 'Entrar'

    click_link 'Cadastre-se'

    expect(page).to have_content 'Cadastre-se'

    fill_in 'E-mail', with: 'admin@appocapi.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirme a senha', with: '12345678'

    click_button 'Registrar'

    expect(page).to have_content 'Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail.'

    expect(page).to_not have_link 'Cadastre-se'
    expect(page).to_not have_link 'Entrar'

    click_link 'admin@appocapi.com'

    expect(page).to have_content 'Editar Usuário'

    expect(page).to have_field 'E-mail', with: 'admin@appocapi.com'
    expect(page).to have_field 'Senha'
    expect(page).to have_field 'Confirme a senha'
    expect(page).to have_field 'Senha atual'

    expect(page).to have_content 'Cancelar minha conta'
    expect(page).to have_content 'insatisfeito ?'
    expect(page).to have_link 'Cancelar minha conta'
    expect(page).to have_link 'Voltar'

    fill_in 'E-mail', with: 'adm@appocapi.com'
    fill_in 'Senha', with: ''
    fill_in 'Confirme a senha', with: ''
    fill_in 'Senha atual', with: '12345678'

    click_button 'Editar'

    expect(page).to have_content 'adm@appocapi.com'
    expect(page).to have_content 'Sua conta foi atualizada com sucesso.'

    click_link 'adm@appocapi.com'

    expect(page).to have_content 'Editar Usuário'

    expect(page).to have_field 'E-mail', with: 'adm@appocapi.com'

    click_link 'Cancelar minha conta'

    expect(page).to have_content 'Tchau! Sua conta foi cancelada com sucesso. Esperamos vê-lo novamente em breve.'

    expect(page).to have_link 'Cadastre-se'
    expect(page).to have_link 'Entrar'

    click_link 'Entrar'

    expect(page).to have_content 'Entrar'

    fill_in 'E-mail', with: 'adm@appocapi.com'
    fill_in 'Senha', with: '12345678'

    click_button 'Entrar'

    expect(page).to have_content 'E-mail ou senha inválidos.'
  end
end
