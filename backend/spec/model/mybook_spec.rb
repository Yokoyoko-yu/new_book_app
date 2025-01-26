require 'rails_helper'

RSpec.describe MyBook do
    before 'ユーザー準備' do
    @user={id:3,name:'ajfds',email:'fslja@dlsj.com',password:'fjsljfsl'}
    end
    it '本の登録' do
        User.create(**@user)
        book=MyBook.new(title:'ああああ',author:'iiiii',read:'0',user_id:'3')
        expect(book).to be_valid
    end

    it '存在しないユーザ' do
        User.create(**@user)
        book=MyBook.new(title:'aaa',author:'fsdjfs',read:'0',user_id:'4')
        expect(book).to be_invalid
        expect(book.errors.full_messages).to include('User must exist')
    end
end