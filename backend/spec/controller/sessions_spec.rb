require 'rails_helper'

RSpec.describe SessionsController,type: :controller do

    describe 'ユーザーのログイン' do
        let(:user_info){{email:'yokoyoko@yu.com',password:'yokoyokoyu'}}

        before do
            User.create(name:'yokoyoko',**user_info)
        end

        it 'ユーザーのログインに成功' do
            post:create,params:{session:user_info}
            expect(response).to have_http_status(:ok)
        end

        it 'ユーザーのログアウトに成功' do
            post:create,params:{session:user_info}
            expect(response).to have_http_status(:ok)
            post:destroy
            expect(response).to have_http_status(:ok)
        end

        it '存在しないメールアドレス' do
            post:create,params:{session:{email:'yokoyoko@ta.com',password:'yokoyokoyu'}}
            expect(response).to have_http_status(422)
        end

        it '存在しないパスワード' do
            post:create,params:{session:{email:'yokoyoko@yu.com',password:'jsjfsjss'}}
            expect(response).to have_http_status(422)
        end
    end


    describe 'ユーザのログインに失敗' do

    end

end