# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  recipe_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  validates :user, :presence => true
  validates :recipe, :presence => true, :uniqueness => { :scope => :user }
    
    # belongs_to :user, :class_name => "User", :foreign_key => "user_id"
    belongs_to :user
    belongs_to :recipe
end
