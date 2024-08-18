class Call < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
end
