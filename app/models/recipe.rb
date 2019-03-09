# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  image       :string
#  instruction :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  rating      :integer
#

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :components, :dependent => :destroy

  validates :user, :presence => true
  validates :instruction, :presence => true
  validates :title, :presence => true
end
