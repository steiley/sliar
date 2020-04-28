require 'rails_helper'

describe 'Users', type: :request do
  describe "GET index" do
    subject { get '/users' }
    context "ログインしていない場合" do
      it "session/newにリダイレクトされる" do
        subject

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "ログインしている場合" do
      before { sign_in(build(:user, id: 1)) }

      it "user#indexページが表示される" do
        subject

        expect(response).to be_successful
      end
    end
  end

  describe "post update" do
    before do
      user = create(:user, id: 1)
      user.password = user.password_confirmation = nil
      sign_in(user)
    end

    let(:burger) { create(:food, emoji: "🍔") }
    let(:sushi) { create(:food, emoji: "🍣") }

    context "自分の更新の場合" do
      it "user#indexページへリダイレクトされ更新成功のメッセージが表示される" do
        patch "/users/1", params: {
          user: {
            email: "updated@sliar.com",
            password: "",
            favorite_food_ids: [burger.id, sushi.id]
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

      it 'returns 404' do
        patch "/users/#{other_user.id}", params: {
          user: {
            email: "updated@sliar.com",
            password: "",
            favorite_food_ids: [burger.id, sushi.id]
          }
        }

        expect(response.status).to eq 404
      end
    end
  end

  describe "delete destroy" do
    before { sign_in(create(:user, id: 1)) }

    it "successes" do
      expect { delete "/users/1" }.to change(User, :count).by(-1)
      expect(response).to redirect_to(new_user_registration_path)
    end
  end
end
