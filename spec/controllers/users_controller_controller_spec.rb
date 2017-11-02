require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "get index" do
    context "ログインしていない場合" do
      it "session/newにリダイレクトされる" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "ログインしている場合" do
      before { warden.set_user(build(:user, id: 1)) }

      it "user#indexページが表示される" do
        get :index

        expect(response).to be_success
      end
    end
  end
end
