module ControllerMacros

  def login_admin
    before(:each) do
      @request.env["devise.mappings"] = Devise.mappings[:admin]
      admin = FactoryGirl.create(:admin)
      sign_in :user, admin # sign_in(scope, resource)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      # user.confirm! # only necessary for confirmable module
      sign_in user
    end
  end

end
