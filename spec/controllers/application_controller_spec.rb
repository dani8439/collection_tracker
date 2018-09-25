require 'spec_helper'
require 'pry'

describe ApplicationController do

  describe "Homepage" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome to Patterns & Pieces")
    end
  end

  describe "Signup Page" do
    it 'loads the signup page' do
      get '/signup'
      expect(last_response.status).to eq(200)
    end

    it 'signup directs user to collection index' do
      params = {
        :username => "BaublesBaloo",
        :email => "Baubles@hotmail.com",
        :password => "Woof!"
      }
      post '/signup', params
      expect(last_response.location).to include("/collections")
    end

    it 'does not let a user signup without a username' do
      params = {
        :username => "",
        :email => "Baubles@hotmail.com",
        :password => "Woof!"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user signup without an email' do
      params = {
        :username => "BaublesBaloo",
        :email => "",
        :password => "Woof!"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user signup without a password' do
      params = {
        :username => "BaublesBaloo",
        :email => "Baubles@hotmail.com",
        :password => ""
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'creates a new user and logs them in on valid submission and does not let a logged in user view the signup page' do
      params = {
        :username => "BaublesBaloo",
        :email => "Baubles@hotmail.com",
        :password => "Woof!"
      }
      post '/signup', params
      get '/signup'
      expect(last_response.location).to include('/collections')
    end
  end

  describe "login" do
    it 'loads the login page' do
      get '/login'
      expect(last_response.status).to eq(200)
    end

    it 'loads the collections index after login' do
      user = User.create(:username => "FalafelMonster", :email => "Challabackyoungin@aol.com", :password =>"harruu")
      params = {
        :username => "FalafelMonster",
        :password => "harruu"
      }
      post '/login', params
      expect(last_response.status).to eq(302)
      follow_redirect!
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome")
    end

    it 'does not let user view login page if already logged in' do
      user = User.create(:username => "FalafelMonster", :email => "Challabackyoungin@aol.com", :password =>"harruu")
      params = {
        :username => "FalafelMonster",
        :password => "harruu"
      }
      post '/login', params
      get '/login'
      expect(last_response.location).to include("/collections")
    end
  end

  describe "logout" do
  end
end
