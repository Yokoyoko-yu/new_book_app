class StaticPageController < ApplicationController
    def sign_in
        puts "Sign in action called"
        render 'static_page/sign_in'
    end
    def home
        render json: { message: "Hello from /home" }, layout: false
        # puts "クッキーの中身#{cookies.inspect}"
    end
end
