Rails.application.routes.draw do
  root 'welcome#index'
  get 'docs' => 'welcome#docs'
end
