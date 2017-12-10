require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  render_views
  let(:user) { User.create!(name: 'paris', email: "paris@gmail.com", password: "abcd1234") }

  let(:valid_attributes) {
    {breed: Faker::ElderScrolls.creature, name: Faker::Simpsons.character}
  }

  let(:invalid_attributes) {
    {breed: '', name: Faker::Simpsons.character}
  }

  before { sign_in(user) }

  describe "GET #new" do
    it "assigns a new pet as @pet" do
      get :new, params: {}

      expect(assigns(:pet)).to be_a_new(Pet)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new pet" do
        expect {
          post :create, params: {pet: valid_attributes}
        }.to change(Pet, :count).by(1)
      end

      it "assigns a newly created roast as @roast" do
        post :create, params: {coffee_roast: valid_attributes}

        expect(assigns(:roast)).to be_a(CoffeeRoast)

        expect(assigns(:roast)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved roast as @roast" do
        post :create, params: {coffee_roast: invalid_attributes}

        expect(assigns(:roast)).to be_a_new(CoffeeRoast)
      end

      it "re-renders the 'new' template" do
        post :create, params: {coffee_roast: invalid_attributes}

        expect(response).to render_template("new")
      end
    end
  end

end
