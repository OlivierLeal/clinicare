class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum group: { admin: 0, engenheiro: 1, tecnico: 2, cliente: 3 }

  before_save :set_default_group

  private

  def set_default_group
    self.group ||= :cliente
  end
end
