class Store < ActiveRecord::Base
  belongs_to :user
  has_many :promotions, dependent: :destroy
end
