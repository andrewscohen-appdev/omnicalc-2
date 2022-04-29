Rails.application.routes.draw do

  get("/wizard_add", { :controller => "application", :action => "addition_results" })
  
  get("/add", { :controller => "application", :action => "addition_form" })

  get("/wizard_street_to_coords", { :controller => "application", :action => "street_to_coords_results" })
  
  get("/street_to_coords/new", { :controller => "application", :action => "street_to_coords_form" })

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
