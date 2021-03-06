require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:user)
    #skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:invalid_user)
    # not the way apparently { some_invented_attribute: 'taco pizza beef' }
    #skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context "with an authenticated user" do
    login_user

    describe "GET #index" do
      it "assigns all users as @users" do
        user = User.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:users)).to include(user)
      end
    end

    describe "GET #show" do
      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        get :show, {:id => user.to_param}, valid_session
        expect(assigns(:user)).to eq(user)
      end
    end

    describe "GET #new" do

      it "assigns a new user as @user" do
        get :new, {}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end
    end

    describe "GET #edit" do
      context "without being an admin" do
        it "allows the current user to edit thier profiles" do
          user = subject.current_user
          puts user.first_name
          get :edit, {id: user.to_param}, valid_session
          expect(assigns(:user)).to eq(user)
        end

        it "only assigns @user if the requested user is the current user" do
          user = User.create! valid_attributes
          get :edit, {id: user.to_param}, valid_session
          expect(assigns(:user)).not_to eq(user)
        end

      end

      context "if current user is an admin" do
        login_admin
        it "assigns the requested user as @user" do
          user = User.create! valid_attributes
          get :edit, {:id => user.to_param}, valid_session
          expect(assigns(:user)).to eq(user)
        end
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new User" do
          expect {
            post :create, {:user => valid_attributes}, valid_session
          }.to change(User, :count).by(1)
        end

        it "assigns a newly created user as @user" do
          post :create, {:user => valid_attributes}, valid_session
          expect(assigns(:user)).to be_a(User)
          expect(assigns(:user)).to be_persisted
        end

        it "redirects to the created user" do
          post :create, {:user => valid_attributes}, valid_session
          expect(response).to redirect_to(User.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved user as @user" do
          post :create, {:user => invalid_attributes}, valid_session
          expect(assigns(:user)).to be_a_new(User)
        end

        it "re-renders the 'new' template" do
          post :create, {:user => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        new_attrs = FactoryGirl.attributes_for(:user)
        let(:new_attributes) {
          new_attrs
          #skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested user" do
          user = User.create! valid_attributes
          put :update, {:id => user.to_param, :user => new_attributes}, valid_session
          user.reload
          expect(user.first_name).to eq(new_attrs[:first_name])

        end

        it "assigns the requested user as @user" do
          user = User.create! valid_attributes
          put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
          expect(assigns(:user)).to eq(user)
        end

        it "redirects to the user" do
          user = User.create! valid_attributes
          put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
          expect(response).to redirect_to(user)
        end
      end

      context "with invalid params" do
        it "assigns the user as @user" do
          user = User.create! valid_attributes
          put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
          expect(assigns(:user)).to eq(user)
        end

        it "re-renders the 'edit' template" do
          user = User.create! valid_attributes
          put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested user" do
        user = User.create! valid_attributes
        expect {
          delete :destroy, {:id => user.to_param}, valid_session
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        user = User.create! valid_attributes
        delete :destroy, {:id => user.to_param}, valid_session
        expect(response).to redirect_to(users_url)
      end
    end
  end

  context "without an authenticated user" do
    describe "GET #index" do
      it "it redirects to the sign in page" do
        get :index, {}, valid_session
        expect(subject).to redirect_to("/users/sign_in")
      end
    end

    describe "GET #show" do
      it "redirects to the sign_in page" do
        user = User.create! valid_attributes
        get :show, {:id => user.to_param}, valid_session
        expect(subject).to redirect_to("/users/sign_in")
      end

      it "does not assign the requested user as @user do I need this test?" do
        user = User.create! valid_attributes
        get :show, {:id => user.to_param}, valid_session
        expect(assigns(:user)).not_to eq(user)
      end
    end

     describe "GET #new" do
       it "redirects to the sign_in page" do
         get :new, {}, valid_session
         expect(subject).to redirect_to("/users/sign_in")
       end
     end

    describe "GET #edit" do
      it "redirects to the sign_in page" do
        user = User.create! valid_attributes
        get :edit, {:id => user.to_param}, valid_session
        expect(subject).to redirect_to("/users/sign_in")
      end
    end

    describe "POST #create" do
      it "redirects to the sign_in page" do
          post :create, {:user => valid_attributes}, valid_session
          expect(subject).to redirect_to("/users/sign_in")
      end

      it "doesn't create a new user" do
          expect {
            post :create, {:user => valid_attributes}, valid_session
          }.to change(User, :count).by(0)
      end
    end

    describe "PUT #update" do
      new_attrs = FactoryGirl.attributes_for(:user)
      let(:new_attributes) {
        new_attrs
      }

      it "doesn't update the requested user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => new_attributes}, valid_session
        user.reload
        expect(user.first_name).not_to eq(new_attrs[:first_name])

      end

      it "redirects to the sign_in page" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(response).to redirect_to("/users/sign_in")
        # expect(subject).to redirect_to("/users/sign_in")
      end
    end

    describe "DELETE #destroy" do
      it "doesn't destroy the requested user" do
        user = User.create! valid_attributes
        expect {
          delete :destroy, {:id => user.to_param}, valid_session
        }.to change(User, :count).by(0)
      end

      it "redirects to the sign_in page" do
        user = User.create! valid_attributes
        delete :destroy, {:id => user.to_param}, valid_session
        #expect(response).to redirect_to(users_url)
        expect(response).to redirect_to("/users/sign_in")
        # expect(subject).to redirect_to("/users/sign_in")
      end
    end
  end


end

