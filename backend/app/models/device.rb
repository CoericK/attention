class Device < ApplicationRecord
  has_many :tracks
  has_many :rotations
end
