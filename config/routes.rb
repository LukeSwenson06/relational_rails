Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/outpatientclinics', to: 'outpatient_clinics#index'
  get '/outpatientclinics/:id', to: 'outpatient_clinics#show'
end
