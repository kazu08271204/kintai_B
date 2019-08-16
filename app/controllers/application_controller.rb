class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #どのコントローラでもヘルパーに定義したメソッドが使える

  $days_of_the_week = %w{日 月 火 水 木 金 土}

end

