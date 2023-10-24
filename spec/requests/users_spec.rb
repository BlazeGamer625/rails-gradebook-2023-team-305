require 'rails_helper'

RSpec.describe "Users", type: :routing do
  describe "registration" do
    it "should not be possible to sign up" do
      expect(get("/users/sign_up")).not_to be_routable
    end
  end
end


RSpec.describe "User login", type: :request do
  before do
    @user = User.create(email: "test@test.com", password: "password")
  end

  it "signs user in with valid credentials" do
    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
    expect(response).to redirect_to(root_path)
  end

  it "doesn't sign in user with invalid email" do
    post user_session_path, params: { user: { email: "invalid_email@test.com", password: @user.password } }
    expect(response).to have_http_status(422)
    expect(response.body).to include("Invalid Email or password.")
  end

  it "doesn't sign in user with invalid password" do
    post user_session_path, params: { user: { email: @user.email, password: "invalid_password" } }
    expect(response).to have_http_status(422)
    expect(response.body).to include("Invalid Email or password.")
  end
end
