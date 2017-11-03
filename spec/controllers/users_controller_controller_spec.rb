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

  describe "post update" do
    before do
      user = create(:user, id: 1)
      user.password = user.password_confirmation = nil
      warden.set_user(user)
    end
    let(:burger) { create(:food, emoji: "🍔") }
    let(:sushi) { create(:food, emoji: "🍣") }

    context "自分の更新の場合" do
      it "user#indexページへリダイレクトされ更新成功のメッセージが表示される" do
        put :update, params: {
          id: 1,
          user: {
            email: "updated@sliar.com",
            password: "",
            food_ids: [burger.id, sushi.id]
          }
        }

        aggregate_failures do
          expect(response).to redirect_to(users_path)
          expect(flash[:notice]).to eq 'User was successfully updated.'
        end
      end
    end

    context "他人の情報を更新しようとした場合" do
      let!(:other_user) { create(:user, id: 2) }

      it "user#indexページへリダイレクトされ、権限がないと表示される" do
        put :update, params: {
          id: other_user.id,
          user: {
            email: "updated@sliar.com",
            password: "",
            food_ids: [burger.id, sushi.id]
          }
        }

        aggregate_failures do
          expect(response).to redirect_to(users_path)
          expect(flash[:notice]).to eq "You don't have a permission!"
        end
      end
    end
  end
end
