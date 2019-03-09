class ComponentsController < ApplicationController
  def index
    @components = Component.all

    render("component_templates/index.html.erb")
  end

  def show
    @component = Component.find(params.fetch("id_to_display"))

    render("component_templates/show.html.erb")
  end

  def new_form
    @component = Component.new

    render("component_templates/new_form.html.erb")
  end

  def create_row
    @component = Component.new

    @component.recipe_id = params.fetch("recipe_id")
    @component.ingredient_id = params.fetch("ingredient_id")

    if @component.valid?
      @component.save

      redirect_back(:fallback_location => "/recipes/#{@component.recipe_id}", :notice => "Recipe updated successfully.")
    else
      render("component_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @component = Component.find(params.fetch("prefill_with_id"))

    render("component_templates/edit_form.html.erb")
  end

  def update_row
    @component = Component.find(params.fetch("id_to_modify"))

    @component.recipe_id = params.fetch("recipe_id")
    @component.ingredient_id = params.fetch("ingredient_id")

    if @component.valid?
      @component.save

      redirect_to("/recipes/#{@component.recipe_id}", :notice => "Recipe updated successfully.")
    else
      render("component_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @component = Component.find(params.fetch("id_to_remove"))

    @component.destroy

    redirect_to("/recipes/#{@component.recipe_id}", :notice => "Recipe updated successfully.")
  end
end
