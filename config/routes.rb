Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/outpatientclinics', to: 'outpatient_clinics#index'
  get '/outpatientclinics/new', to: 'outpatient_clinics#new'
  post '/outpatientclinics', to: 'outpatient_clinics#create'
  get '/outpatientclinics/:id', to: 'outpatient_clinics#show'
  get '/outpatientclinics/:id/edit', to: 'outpatient_clinics#edit'
  patch '/outpatientclinics/:id', to: 'outpatient_clinics#update'
  get '/providers', to: 'providers#index'
  get '/providers/:id', to: 'providers#show'
  get '/providers/:id/edit', to: 'providers#edit'
  patch '/providers/:id', to: 'providers#update'
  get '/outpatientclinics/:outpatientclinics_id/providers/new', to: 'outpatient_clinics_providers#new'
  get '/outpatientclinics/:outpatientclinics_id/providers', to: 'outpatient_clinics_providers#index'
  post '/outpatientclinics/:outpatientclinics_id/providers', to: 'outpatient_clinics_providers#create'
end
