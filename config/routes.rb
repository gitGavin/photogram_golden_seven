Rails.application.routes.draw do
  # CREATE
  get("/photos/new", { :controller => "photos", :action => "new_form"})
  get("/photos/create_photo", { :controller => "photos", :action => "create_row"})

  # READ
  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:the_id_number", { :controller => "photos", :action => "show"})

  # UPDATE
  get("/photos/:the_id/edit", { :controller => "photos", :action => "edit_form"})

  # DELETE
  get("/delete_photo/:id", { :controller => "photos", :action => "destroy" })

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
