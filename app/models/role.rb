class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  scopify

  def to_s
    case name
    when "admin"
      "Администратор"
    when "observer"
      "Наблюдатель"
    when "manager"
      "Управляющий"
    when "attorney"
      "Адвокат"
    else
      "No role"
    end
  end 
end
