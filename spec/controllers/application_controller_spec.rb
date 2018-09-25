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
      get '/signup' do
        expect(last_response.status).to eq(200)
      end
    end
  end
end
