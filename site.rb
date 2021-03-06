require 'rubygems'
require "bundler/setup"

require 'sinatra/base'
require 'sinatra/content_for'
require './config'

class Site < Sinatra::Base
  
  enable  :static, :sessions
  set     :root, File.dirname(__FILE__)
  set     :public, Proc.new { File.join(root, "public") }
  
  helpers Sinatra::ContentFor
  
  helpers do
    def title(t = nil)
      @title = t if t
      @title
    end
  end
  
  before do
    session[:user_id] ||= Time.now.to_i
  end
  
  get '/?' do
    title 'Index'
    erb :index
  end
  
  get '/panel' do
    title "Sumavisos Properties Parsers Dashboard"
    erb :panel, :layout => :layout_panel
  end
  
  get '/:example_name' do |example_name|
    titles = { "chat" => "Basic Chat", "todo" => "ToDo List", "drawing" => "Drawing Board"}
    title titles[example_name]
    erb example_name.to_sym
  end
end
