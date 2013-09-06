# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#User.delete_all
puts 'ROLES'
['admin','observer', 'manager', 'attorney'].each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end
puts 'DEFAU-LT USERS'
User.delete_all
user = User.find_or_create_by_email :email => APP['ADMIN_EMAIL'].dup, :password => APP['ADMIN_PASSWORD'].dup, :password_confirmation => APP['ADMIN_PASSWORD'].dup, phone: APP['ADMIN_PHONE'], fio: APP['ADMIN_FIO'].dup, register_number: 1
puts 'user: ' << user.fio
#user.confirm!
user.add_role :admin
user.save!


