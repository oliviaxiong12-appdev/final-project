class CommentsController < ApplicationController
  def create_row
    @comment = Comment.new

    @comment.user_id = params.fetch("user_id")
    @comment.recipe_id = params.fetch("recipe_id")
    @comment.body = params.fetch("body")

    if @comment.valid?
      @comment.save

      redirect_back(:fallback_location => "/comments", :notice => "Comment created successfully.")
    else
      render("comment_templates/new_form_with_errors.html.erb")
    end
  end


  def update_row
    @comment = Comment.find(params.fetch("id_to_modify"))

    @comment.user_id = params.fetch("user_id")
    @comment.recipe_id = params.fetch("recipe_id")
    @comment.body = params.fetch("body")

    if @comment.valid?
      @comment.save

      redirect_to("/comments/#{@comment.id}", :notice => "Comment updated successfully.")
    else
      render("comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @comment = Comment.find(params.fetch("id_to_remove"))
    @comment.destroy

    redirect_to("/recipes/", :notice => "Comment deleted.")
  end
end
