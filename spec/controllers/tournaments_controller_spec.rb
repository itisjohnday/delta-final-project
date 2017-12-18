require 'rails_helper'

RSpec.describe TournamentsController, type: :controller do
  render_views
  let(:user) { User.create!(name: 'paris', email: "paris@gmail.com", password: "abcd1234") }

  let(:valid_attributes) {
    {theme: 'holiday' }
  }

  let(:invalid_attributes) {
    { }
  }

  before { sign_in(user) }

  describe "GET #new" do
    it "assigns a new tournament as @tournament" do
      get :new, params: {}

      expect(assigns(:tournament)).to be_a_new(Tournament)
    end
  end

  describe "GET #edit" do
    it "assigns the tournament to be edited as @tournament" do
      tournament = Tournament.create! valid_attributes

      get :edit, params: {id: tournament.id}

      expect(assigns(:tournament)).to eq(tournament)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new tournament" do
        expect {
          post :create, params: {tournament: valid_attributes}
        }.to change(Tournament, :count).by(1)
      end

      it "assigns a newly created tournament as @tournament" do
        post :create, params: {tournament: valid_attributes}

        expect(assigns(:tournament)).to be_a(Pet)

        expect(assigns(:tournament)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved tournament as @tournament" do
        post :create, params: {tournament: invalid_attributes}

        expect(assigns(:tournament)).to be_a_new(Pet)
      end

      it "re-renders the 'new' template" do
        post :create, params: {tournament: invalid_attributes}

        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { theme: 'Presidents Day' } }

      it "updates the requested tournament" do
        tournament = Tournament.create! valid_attributes
        expect {
          put :update, params: {theme: tournament.to_param, tournament: new_attributes}
        }.to change {
          tournament.reload.tournament
        }
      end

      it "assigns the requested tournament as @tournament" do
        tournament = Tournament.create! valid_attributes

        put :update, params: {id: tournament.id, tournament: valid_attributes}

        expect(assigns(:tournament)).to eq(tournament)
      end

    end

    context "with invalid params" do
      it "assigns the tournament as @tournament" do
        tournament = Tournament.create! valid_attributes

        put :update, params: {id: tournament.to_param, tournament: invalid_attributes}

        expect(assigns(:tournament)).to eq(tournament)
      end

      it "re-renders the 'edit' template" do
        tournament = Tournament.create! valid_attributes

        put :update, params: {id: tournament.to_param, tournament: invalid_attributes}

        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested tournament" do
      tournament = Tournament.create! valid_attributes

      expect {
        delete :destroy, params: {id: tournament.to_param}
      }.to decrement(Tournament, :count).by(1)
    end

    it "redirects to the pets list" do
      tournament = Tournament.create! valid_attributes

      delete :destroy, params: {id: tournament.to_param}

      expect(response).to redirect_to(tournaments_path)
    end
  end
end