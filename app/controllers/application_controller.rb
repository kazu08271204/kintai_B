class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #どのコントローラでもヘルパーに定義したメソッドが使える
end
