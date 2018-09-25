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
    it "lets a user logout if they are already logged in" do
      user = User.create(:username => "FalafelMonster", :email => "Challabackyoungin@aol.com", :password =>"harruu")
      params = {
        :username => "FalafelMonster",
        :password => "harruu"
      }
      post '/login', params
      get '/logout'
      expect(last_response.location).to include("/login")
    end

    it 'does not let a user logout if not logged in' do
      get '/logout'
      expect(last_response.location).to include("/")
    end

    it 'does not load /collections if user not logged in' do
      get '/collections'
      expect(last_response.location).to include("/login")
    end

    it 'does load /collections if user is logged in' do
      user = User.create(:username => "FalafelMonster", :email => "Challabackyoungin@aol.com", :password =>"harruu")

      visit '/login'

      fill_in(:username, :with => "FalafelMonster")
      fill_in(:password, :with => "harruu")
      click_button 'Submit'
      expect(page.current_path).to eq('/collections')
    end
  end

  describe 'user show page' do
    it 'shows all a single users collections' do
      user = User.create(:username => "FalafelMonster", :email => "Challabackyoungin@aol.com", :password =>"harruu")
      # Think I need to flip object relationships and controllers - A user has many pieces, piece belongs to a pattern, and a pattern has many pieces
      # don't think it should be "collections" (also because sounds awkward), but should start with pieces, and relationship moves down from there. Have
      # to figure out where join table is.
      piece1 = Piece.create(name: "Jug", size: "1/4 Pint", pattern_name: "Utility")
      piece2 = Piece.create(name: "Bowl", size: "French", pattern_name: "Utility")
      get "/users/#{user.id}"

      expect(last_response.body).to include("1/4 Pint")
      expect(last_response.body).to include("Bowl")
    end
  end
end
