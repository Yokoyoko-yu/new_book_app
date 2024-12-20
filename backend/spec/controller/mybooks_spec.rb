require 'rails_helper'

RSpec.describe  MyBooksController,type: :controller do
    let(:user){User.new(name:'yokoyu',email:'yoko@yoko.com',password:'yokoyu')}
    let(:book){{title:'夕子ちゃんの近道',author:'長嶋有'}}
    let(:delete_book){{title:'風層の教室',author:'山田詠美'}}
    before do
        #current_userがuserを返すようにスタブ化
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow(controller).to receive(:current_user).and_return(user)
    end


    describe '#index' do
    it '本の一覧を取得する' do
        get :index,params:{id:user}
        expect(response).to have_http_status(:ok)
    end
    end

    describe '#create' do
    it '本を登録する' do
        post :create,params:{my_book:book}
        expect(response).to have_http_status(:ok)
    end
    end

    describe '#destroy' do
    it '本を登録して削除する' do
        post :create,params:{my_book:delete_book}
        expect(response).to have_http_status(:ok)
        delete :destroy,params:{id:1}
        expect(response).to have_http_status(:ok)
    end
    end


end