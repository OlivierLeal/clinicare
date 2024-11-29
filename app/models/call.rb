class Call < ApplicationRecord
  belongs_to :user
  has_one :service, dependent: :destroy
  validates :title, :description, presence: true


  def getService
    service = Service.find_by(call_id: self.id)
    return service
  end
end
