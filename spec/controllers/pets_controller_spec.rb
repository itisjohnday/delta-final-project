require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  render_views
  let(:user) { User.create!(name: 'paris', email: "paris@gmail.com", password: "abcd1234") }

  let(:valid_attributes) {
    {breed: Faker::ElderScrolls.creature, name: Faker::Simpsons.character,user_id: user.id }
  }

  let(:invalid_attributes) {
    { breed: "", name: Faker::Simpsons.character, user_id: user.id }
  }

  before { sign_in(user) }

  describe "GET #new" do
    it "assigns a new pet as @pet" do
      get :new, params: {}

      expect(assigns(:pet)).to be_a_new(Pet)
    end
  end

  describe "GET #edit" do
    it "assigns the pet to be edited as @pet" do
      pet = Pet.create! valid_attributes

      get :edit, params: {id: pet.id}

      expect(assigns(:pet)).to eq(pet)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new pet" do
        expect {
          post :create, params: {pet: valid_attributes}
        }.to change(Pet, :count).by(1)
      end

      it "assigns a newly created pet as @pet" do
        post :create, params: {pet: valid_attributes}

        expect(assigns(:pet)).to be_a(Pet)

        expect(assigns(:pet)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved pet as @pet" do
        post :create, params: {pet: invalid_attributes}

        expect(assigns(:pet)).to be_a_new(Pet)
      end

      it "re-renders the 'new' template" do
        post :create, params: {pet: invalid_attributes}

        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'rex' }
      }

      it "updates the requested pet" do
        pet = Pet.create! valid_attributes
        expect {
          put :update, params: {id: pet.to_param, pet: new_attributes}
        }.to change {
          pet.reload.name
        }
      end

      it "assigns the requested pet as @pet" do
        pet = Pet.create! valid_attributes

        put :update, params: {id: pet.id, pet: valid_attributes}

        expect(assigns(:pet)).to eq(pet)
      end

    end

    context "with invalid params" do
      it "assigns the pet as @pet" do
        pet = Pet.create! valid_attributes

        put :update, params: {id: pet.to_param, pet: invalid_attributes}

        expect(assigns(:pet)).to eq(pet)
      end

      it "re-renders the 'edit' template" do
        pet = Pet.create! valid_attributes

        put :update, params: {id: pet.to_param, pet: invalid_attributes}

        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested pet" do
      pet = Pet.create! valid_attributes

      expect {
        delete :destroy, params: {id: pet.to_param}
      }.to change(Pet, :count).by(-1)
    end

    it "redirects to the pets list" do
      pet = Pet.create! valid_attributes

      delete :destroy, params: {id: pet.to_param}

      expect(response).to redirect_to(pets_path)
    end
  end

end
