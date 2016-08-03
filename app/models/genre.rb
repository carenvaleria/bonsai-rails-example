class Genre < ApplicationRecord
  has_many :books
  has_many :authors,    through: :books
  has_many :publishers, through: :books
  
  validates :name, presence: true

  def to_s
    name
  end
end
