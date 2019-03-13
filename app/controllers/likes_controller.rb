class LikesController < ApplicationController

  def show_my_likes

    render("like_templates/show_my_likes.html.erb")
  end

  def create_row
    @like = Like.new

    @like.user_id = params.fetch("user_id")
    @like.recipe_id = params.fetch("recipe_id")
    @like.save

    redirect_back(:fallback_location => "/likes", :notice => "Recipe liked!")
  end


  def update_row
    @like = Like.find(params.fetch("id_to_modify"))

    @like.user_id = params.fetch("user_id")
    @like.recipe_id = params.fetch("recipe_id")
    @like.save

      redirect_to("/likes/#{@like.id}", :notice => "Like updated successfully.")
  end

  def destroy_row
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/my_likes", :notice => "Recipe unliked!")
  end
end
