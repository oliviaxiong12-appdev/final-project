Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root "recipes#index"
  # Routes for the Pantry resource:

  # CREATE
  post("/create_pantry", { :controller => "pantries", :action => "create_row" })

  # READ
  get("/pantry", { :controller => "pantries", :action => "index" })

  # UPDATE
  post("/update_pantry/:id_to_modify", { :controller => "pantries", :action => "update_row" })

  # DELETE
  get("/delete_pantry/:id_to_remove", { :controller => "pantries", :action => "destroy_row" })

  #------------------------------
  # Routes for the Ingredient resource:
  
  # CREATE
  get("/ingredients/new", { :controller => "ingredients", :action => "new_form" })
  post("/create_ingredient", { :controller => "ingredients", :action => "create_row" })

  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })
  get("/ingredients/:id_to_display", { :controller => "ingredients", :action => "show" })

  # UPDATE
  get("/ingredients/:prefill_with_id/edit", { :controller => "ingredients", :action => "edit_form" })
  post("/update_ingredient/:id_to_modify", { :controller => "ingredients", :action => "update_row" })

  # DELETE
  get("/delete_ingredient/:id_to_remove", { :controller => "ingredients", :action => "destroy_row" })

  #------------------------------

  # Routes for the Component resource:

  post("/create_component", { :controller => "components", :action => "create_row" })
  
  post("/update_component/:id_to_modify", { :controller => "components", :action => "update_row" })

  # DELETE
  get("/delete_component/:id_to_remove", { :controller => "components", :action => "destroy_row" })

  #------------------------------

  # Routes for the Recipe resource:

  # CREATE
  get("/recipes/new", { :controller => "recipes", :action => "new_form" })
  post("/create_recipe", { :controller => "recipes", :action => "create_row" })

  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })
  get("/recipes/:id_to_display", { :controller => "recipes", :action => "show" })

  # UPDATE
  get("/recipes/:prefill_with_id/edit", { :controller => "recipes", :action => "edit_form" })
  post("/update_recipe/:id_to_modify", { :controller => "recipes", :action => "update_row" })

  # DELETE
  get("/delete_recipe/:id_to_remove", { :controller => "recipes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Comment resource:

  post("/create_comment", { :controller => "comments", :action => "create_row" })

  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })

  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Like resource:
  
  get("/my_likes", { :controller => "likes", :action => "show_my_likes" })
  
  # CREATE
  post("/create_like", { :controller => "likes", :action => "create_row" })

  # UPDATE
  post("/update_like/:id_to_modify", { :controller => "likes", :action => "update_row" })

  # DELETE
  get("/delete_like/:id_to_remove", { :controller => "likes", :action => "destroy_row" })

  #------------------------------
  
  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  # DELETE
  get("/delete_user/:id_to_remove", { :controller => "users", :action => "destroy_row" })

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
