Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'home#top'
  get '/' => 'home#top'
  get 'about' => 'home#about'

  get 'posts/index/:id' => 'posts#index'#企業一覧ページ
  get 'posts/newcompany' => 'posts#newcompany'#新規企業作成ページ
  post 'posts/createcompany' => 'posts#createcompany'#新規企業作成ページ
  get 'posts/company/:id/:id' => 'posts#company'#ES一覧ページ
  get 'posts/newes' => 'posts#newes'

  get 'comment/new' 
  
end
