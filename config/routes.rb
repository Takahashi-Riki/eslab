Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'home#top'
  get '/' => 'home#top'
  get 'about' => 'home#about'

  get 'posts/index/:user_id' => 'posts#index'#企業一覧ページ
  get 'posts/newcompany' => 'posts#newcompany'#新規企業作成ページ
  post 'posts/createcompany' => 'posts#createcompany'#新規企業作成ページ
  get 'posts/company/:user_id/:company_id' => 'posts#company'#ES一覧ページ
  get 'posts/newes/:user_id/:company_id' => 'posts#newes'#新規ES作成ページ
  post 'posts/createes/:user_id/:company_id' => 'posts#createes'#新規ES作成ページ
  get 'posts/company/:user_id/:company_id/:post_id' => 'posts#es'#各ESページ

  get 'comment/entry/:user_id/:company_id/:post_id' => 'comment#entry'#コメント入場ページ
  post 'comment/check/:user_id/:company_id/:post_id' => 'comment#check'#コメント入場ページ
  get 'comment/new/:user_id/:company_id/:post_id' => 'comment#new'#新規コメント作成ページ
  post 'comment/create/:user_id/:company_id/:post_id' => 'comment#create'#新規コメント作成ページ
  get 'comment/finish/:user_id/:company_id/:post_id' => 'comment#finish'#コメント作成完了ページ

end
