class Dog < ApplicationRecord
  belongs_to :dog
  belongs_to :breed
  belongs_to :owner
  has_many :vet_visits

  validates :name, presence: true, length: { minimum: 2 }
  validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
end
