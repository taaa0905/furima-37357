require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'メッセージ投稿機能' do
    context 'メッセージ投稿ができる場合' do
      it 'メッセージに内容が入力されている' do
        expect(@comment).to be_valid
      end
    end

    context 'メッセージ投稿ができない場合' do
      it '1文字も入力されていない場合投稿できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content is too short (minimum is 1 character)")
      end
      it '200文字より多い文字数で入力されている場合投稿できない' do
        @comment.content = 'ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content is too long (maximum is 200 characters)")
      end
    end
  end
end
