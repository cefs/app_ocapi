admin = User.new email: 'admin@appocapi.com', password: '12345678', password_confirmation: '12345678'
admin.role = 'admin'
admin.save

visitante = User.new email: 'visitante@appocapi.com', password: '12345678', password_confirmation: '12345678'
visitante.save

7.times.each do |i|
  Advertising.create title: "Meu carro #{i} km", description: 'Meu carro esta em otimo estado desde 199#{i}!', user: admin, status: Status::APPROVED
end

3.times.each do |i|
  Advertising.create title: 'Minha torradeira 198#{i}', description: 'minha torradeira de 198#{i} tem #{i} utilizadade(s)', user: visitante, status: Status::PENDING
end


