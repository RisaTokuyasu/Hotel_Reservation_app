class ApplicationController < ActionController::Base
    
    def after_sign_in_path_for(resource)
      if current_user
         flash[:notice] = "ログインに成功しました" 
         root_path #ログイン後に遷移するpathを設定　
     else
         flash[:notice] = "新規登録完了しました。" 
         users_update_path  #　指定したいパスに変更　　ユーザ登録画面に移行
     end
   end

   def after_sign_out_path_for(resource)
       root_path # ログアウト後に遷移するpathを設定
   end

   before_action :configure_permitted_parmeteres, if: :devise_controller?

   protected
   def configure_permitted_parmeteres
       devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
       # アカウント編集の時にnameとprofileのストロングパラメータを追加
       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile,:image])
   end

end
