require 'spec_helper'

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

describe AttorneyFormationsController do

  # This should return the minimal set of attributes required to create a valid
  # AttorneyFormation. As you add validations to AttorneyFormation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AttorneyFormationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all attorney_formations as @attorney_formations" do
      attorney_formation = AttorneyFormation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:attorney_formations).should eq([attorney_formation])
    end
  end

  describe "GET show" do
    it "assigns the requested attorney_formation as @attorney_formation" do
      attorney_formation = AttorneyFormation.create! valid_attributes
      get :show, {:id => attorney_formation.to_param}, valid_session
      assigns(:attorney_formation).should eq(attorney_formation)
    end
  end

  describe "GET new" do
    it "assigns a new attorney_formation as @attorney_formation" do
      get :new, {}, valid_session
      assigns(:attorney_formation).should be_a_new(AttorneyFormation)
    end
  end

  describe "GET edit" do
    it "assigns the requested attorney_formation as @attorney_formation" do
      attorney_formation = AttorneyFormation.create! valid_attributes
      get :edit, {:id => attorney_formation.to_param}, valid_session
      assigns(:attorney_formation).should eq(attorney_formation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AttorneyFormation" do
        expect {
          post :create, {:attorney_formation => valid_attributes}, valid_session
        }.to change(AttorneyFormation, :count).by(1)
      end

      it "assigns a newly created attorney_formation as @attorney_formation" do
        post :create, {:attorney_formation => valid_attributes}, valid_session
        assigns(:attorney_formation).should be_a(AttorneyFormation)
        assigns(:attorney_formation).should be_persisted
      end

      it "redirects to the created attorney_formation" do
        post :create, {:attorney_formation => valid_attributes}, valid_session
        response.should redirect_to(AttorneyFormation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved attorney_formation as @attorney_formation" do
        # Trigger the behavior that occurs when invalid params are submitted
        AttorneyFormation.any_instance.stub(:save).and_return(false)
        post :create, {:attorney_formation => { "name" => "invalid value" }}, valid_session
        assigns(:attorney_formation).should be_a_new(AttorneyFormation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AttorneyFormation.any_instance.stub(:save).and_return(false)
        post :create, {:attorney_formation => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested attorney_formation" do
        attorney_formation = AttorneyFormation.create! valid_attributes
        # Assuming there are no other attorney_formations in the database, this
        # specifies that the AttorneyFormation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AttorneyFormation.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => attorney_formation.to_param, :attorney_formation => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested attorney_formation as @attorney_formation" do
        attorney_formation = AttorneyFormation.create! valid_attributes
        put :update, {:id => attorney_formation.to_param, :attorney_formation => valid_attributes}, valid_session
        assigns(:attorney_formation).should eq(attorney_formation)
      end

      it "redirects to the attorney_formation" do
        attorney_formation = AttorneyFormation.create! valid_attributes
        put :update, {:id => attorney_formation.to_param, :attorney_formation => valid_attributes}, valid_session
        response.should redirect_to(attorney_formation)
      end
    end

    describe "with invalid params" do
      it "assigns the attorney_formation as @attorney_formation" do
        attorney_formation = AttorneyFormation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AttorneyFormation.any_instance.stub(:save).and_return(false)
        put :update, {:id => attorney_formation.to_param, :attorney_formation => { "name" => "invalid value" }}, valid_session
        assigns(:attorney_formation).should eq(attorney_formation)
      end

      it "re-renders the 'edit' template" do
        attorney_formation = AttorneyFormation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AttorneyFormation.any_instance.stub(:save).and_return(false)
        put :update, {:id => attorney_formation.to_param, :attorney_formation => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested attorney_formation" do
      attorney_formation = AttorneyFormation.create! valid_attributes
      expect {
        delete :destroy, {:id => attorney_formation.to_param}, valid_session
      }.to change(AttorneyFormation, :count).by(-1)
    end

    it "redirects to the attorney_formations list" do
      attorney_formation = AttorneyFormation.create! valid_attributes
      delete :destroy, {:id => attorney_formation.to_param}, valid_session
      response.should redirect_to(attorney_formations_url)
    end
  end

end