require 'rails_helper'

RSpec.describe SecurityNotesController, type: :controller do
  before { login_user create(:user) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
