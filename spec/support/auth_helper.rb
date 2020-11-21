# frozen_string_literal: true

module AuthHelper
  def login_user
    # Before each test, create and login the user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = FactoryBot.create(:user)
      sign_in @user
    end
  end

  def logout_user
    sign_out @user if @user
  end
end
