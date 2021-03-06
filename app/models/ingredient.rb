# == Schema Information
#
# Table name: ingredients
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :components
  has_many :recipes, -> { distinct }, through: :components

  validates :user, :presence => true
  validates :title, :presence => true, uniqueness: { message: "has already been created"}
  validates :description, :presence => true
end
