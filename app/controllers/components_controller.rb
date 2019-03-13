class ComponentsController < ApplicationController

  def create_row
    @component = Component.new

    @component.recipe_id = params.fetch("recipe_id")
    @component.ingredient_id = params.fetch("ingredient_id")
    @component.amount = params.fetch("amount")

    if @component.valid?
      @component.save

      redirect_back(:fallback_location => "/recipes/#{@component.recipe_id}", :notice => "Recipe updated successfully.")
    end
  end

  def update_row
    @component = Component.find(params.fetch("id_to_modify"))

    @component.recipe_id = params.fetch("recipe_id")
    @component.ingredient_id = params.fetch("ingredient_id")
    @component.amount = params.fetch("amount")

    if @component.valid?
      @component.save

      redirect_to("/recipes/#{@component.recipe_id}", :notice => "Recipe updated successfully.")
    end
  end

  def destroy_row
    @component = Component.find(params.fetch("id_to_remove"))

    @component.destroy

    redirect_to("/recipes/#{@component.recipe_id}", :notice => "Recipe updated successfully.")
  end
end
