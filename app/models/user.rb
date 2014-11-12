class User < ActiveRecord::Base
  validates :sid, presence: true, numericality: true
  validates :uid, presence: true, numericality: true
  validates :name, presence: true
  has_many :groups
end
