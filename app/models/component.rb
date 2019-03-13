# == Schema Information
#
# Table name: components
#
#  id            :integer          not null, primary key
#  recipe_id     :integer
#  ingredient_id :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  amount        :string
#

class Component < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, :presence => true
  validates :ingredient, :presence => true
end
