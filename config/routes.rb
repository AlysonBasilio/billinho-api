Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :institutions do
    resources :registrations
  end
  resources :students do
    resources :registrations
  end
  resources :registrations do
    resources :invoices
  end
  resources :invoices
end
