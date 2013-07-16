# encoding: utf-8
require 'machinist/active_record'

User.blueprint(:admin) do
  email { 'admin@appocapi.com' }
  password { '12345678' }
  password_confirmation { '12345678' }
  role { Role::ADMIN }
end

User.blueprint(:sr_carlos) do
  email { 'sr_carlos@appocapi.com' }
  password { '12345678' }
  password_confirmation { '12345678' }
  role { Role::VISITOR }
end

Advertising.blueprint(:anuncio_carro_aprovado) do
  title { 'Titulo do anúncio' }
  description { 'Descrição do anúncio' }
  status { Status::APPROVED }
end

Advertising.blueprint(:anuncio_bicicleta_pendente) do
  title { 'Titulo do anúncio bicicleta' }
  description { 'Descrição do anúncio bicicleta' }
  status { Status::PENDING }
end
