require 'rails_helper'

RSpec.describe UsersController,type: :controller do
    let(:user_info){{name:'yoko',email:'yokoyoko@yoko.com',password:'yokoyokoyu'}}

    describe 'ユーザーの作成' do
        it 'ユーザーの作成に成功' do
            post:create,params:{user:user_info}
            expect(response).to have_http_status(:ok)
        end

        # it 'ユーザーの作成に失敗' do
        #     p
        # end
    end

    describe '不正なユーザーの作成にエラーを返す' do 
        # it '不正なparams' do
        #     post:create,params:{user:{**user_info,cookies:'yokoyoko'}}
        #     expect(@user).to eq(:user_info)
        # end

        it '不正なパスワード' do
            post:create,params:{user:{name:'yokota',email:'yoko@yudai.com',password:'aa'}}
            expect(response).to have_http_status(:unprocessable_entity)
        end

        it '既に使われているメールアドレス' do
            post:create,params:{user:user_info}
            post:create,params:{user:user_info}
            expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'メールアドレスがない' do
            post:create,params:{user:{name:'yokota',password:'lsjljljfsd'}}
            expect(response).to have_http_status(:unprocessable_entity)
        end
    end

end