Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'home#top'
  get '/' => 'home#top'
  get 'about' => 'home#about'

  get 'posts/index/:id' => 'posts#index'#企業一覧ページ
  get 'posts/newcompany' => 'posts#newcompany'#新規企業作成ページ
  post 'posts/createcompany' => 'posts#createcompany'#新規企業作成ページ
  post 'posts/company/delete/:id/:company_id' => 'posts#deletecompany'#企業更新ページ
  get 'posts/company/:id/:company_id' => 'posts#company'#ES一覧ページ
  get 'posts/newes/:id/:company_id' => 'posts#newes'#新規ES作成ページ
  post 'posts/createes/:id/:company_id' => 'posts#createes'#新規ES作成ページ
  get 'posts/company/:id/:company_id/:post_id' => 'posts#es'#各ESページ
  post 'posts/es/ifseen/:id/:company_id/:post_id' => 'posts#ifseenes'#ES既読ページ
  post 'posts/es/delete/:id/:company_id/:post_id' => 'posts#deletees'#ES削除ページ
  get 'posts/es/edit/:id/:company_id/:post_id' => 'posts#edites'#ES更新ページ
  post 'posts/es/update/:id/:company_id/:post_id' => 'posts#updatees'#ES更新ページ

  get 'comment/entry/:id/:company_id/:post_id' => 'comment#entry'#コメント入場ページ
  post 'comment/check/:id/:company_id/:post_id' => 'comment#check'#コメント入場ページ
  get 'comment/new/:id/:company_id/:post_id' => 'comment#new'#新規コメント作成ページ
  post 'comment/create/:id/:company_id/:post_id' => 'comment#create'#新規コメント作成ページ
  get 'comment/finish/:id/:company_id/:post_id' => 'comment#finish'#コメント作成完了ページ

end
