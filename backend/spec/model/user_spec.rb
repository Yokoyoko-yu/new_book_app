require 'rails_helper'

RSpec.describe User do
    it '有効なユーザーが保存できる' do
        user=User.new(name:'yokoyokosan',email:'fa3234xv@ed.ritsumei.ac.jp',password:'slfjldsj')
        expect(user).to be_valid
    end

    it '無効なメールアドレス' do
        user=User.new(name:'aaaaaa',email:'kkkkkkk',password:'afjlslsjf')
        expect(user).to be_invalid
    end

    it '重複したメールアドレスは無効' do
        User.create(name:'aaaaaaa',email:'aaa@aa.aa',password:'flsjlfjs')
        anoter_user=User.new(name:'jfslfjls',email:'aaa@aa.aa',password:'lfsljfs')
        expect(anoter_user).to be_invalid
        expect(anoter_user.errors[:email]).to include('has already been taken')
    end


    it '短いメールアドレス' do
        user=User.new(name:'aaaaaaa',email:'a@d.m',password:'jfjfjfjfjf')
        expect(user).to be_invalid
    end

    it '無効なパスワード' do
        user=User.new(name:'aaaaaa',email:'fa3234xv@ed.ritsumei.ac.jp',password:'ttt')
        expect(user).to be_invalid
    end


end