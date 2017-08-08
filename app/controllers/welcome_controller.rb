class WelcomeController < ApplicationController
def index
  flash[:notice] = "向陈慧娟同学学习！"
end 
end
