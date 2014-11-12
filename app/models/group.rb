class Group < ActiveRecord::Base
  validates :user_id, presence: true, numericality: true
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  belongs_to :user
end
