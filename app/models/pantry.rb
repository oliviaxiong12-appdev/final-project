# == Schema Information
#
# Table name: pantries
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  ingredient_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Pantry < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  
  validates :ingredient, uniqueness: {
    scope: :user,
    message: "is already in your pantry!"
  }
end
