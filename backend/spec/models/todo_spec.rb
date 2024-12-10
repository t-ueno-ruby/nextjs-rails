require 'rails_helper'

RSpec.describe Todo, type: :model do

  it '有効な値のとき有効であること' do
    todo = build(:todo)
    expect(todo).to be_valid
  end

  describe 'バリデーション' do
    context "description" do
      it 'descriptionが255文字のとき有効であること' do
        todo = build(:todo, description: 'a' * 255)
        expect(todo).to be_valid
      end

      it 'descriptionが256文字のとき無効であること' do
        todo = build(:todo, description: 'a' * 256)
        expect(todo).to be_invalid
      end
    end

    context "status" do
      it '有効なパラメーターのとき有効であること' do
        todo = build(:todo, status: :completed)
        expect(todo).to be_valid
        todo.status = :not_completed
        expect(todo).to be_valid
      end

      it '無効なパラメーターのとき無効であること' do
        todo = build(:todo, status: 'invalid_status')
        expect(todo).to be_invalid
      end
    end

    context "title" do
      it 'titleが重複していないとき有効であること' do
        todo = build(:todo)
        expect(todo).to be_valid
      end

      it 'titleが未入力のとき無効であること' do
        todo = build(:todo, title: nil)
        expect(todo).to be_invalid
      end

      it 'titleが80文字のとき有効であること' do
        todo = build(:todo, title: 'a' * 80)
        expect(todo).to be_valid
      end

      it 'titleが81文字のとき無効であること' do
        todo = build(:todo, title: 'a' * 81)
        expect(todo).to be_invalid
      end

      it 'titleが重複しているとき無効であること' do
        create(:todo, title: 'テストタイトル')
        todo = build(:todo, title: 'テストタイトル')
        expect(todo).to be_invalid
      end
    end
  end
end
