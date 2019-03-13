class PantriesController < ApplicationController
  def index
    @pantries = Pantry.all
    
    render("pantry_templates/index.html.erb")
  end

  def create_row
    @pantry = Pantry.new

    @pantry.user_id = params.fetch("user_id")
    @pantry.ingredient_id = params.fetch("ingredient_id")

    if @pantry.valid?
      @pantry.save

      redirect_back(:fallback_location => "/pantry", :notice => "Pantry updated successfully.")
    else
      render("pantry_templates/index.html.erb")
    end
  end

  def update_row
    @pantry = Pantry.find(params.fetch("id_to_modify"))

    @pantry.user_id = params.fetch("user_id")
    @pantry.ingredient_id = params.fetch("ingredient_id")

    if @pantry.valid?
      @pantry.save

      redirect_to("/pantry", :notice => "Pantry updated successfully.")
    else
      render("pantry_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @pantry = Pantry.find(params.fetch("id_to_remove"))

    @pantry.destroy

    redirect_to("/pantry/", :notice => "Pantry updated successfully.")
  end
end
