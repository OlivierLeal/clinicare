class Service < ApplicationRecord
  belongs_to :call
  validates :status, presence: true

  enum status: { aguardando: 0, em_processo: 1, finalizado: 2 }
end
