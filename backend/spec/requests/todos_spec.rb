# https://qiita.com/t2kojima/items/ad7a8ade9e7a99fb4384
# https://qiita.com/KNR109/items/fe331069c4f958efbd96#get%E3%83%AA%E3%82%AF%E3%82%A8%E3%82%B9%E3%83%88%E3%81%AE%E3%83%86%E3%82%B9%E3%83%88
# https://qiita.com/motoki4917/items/ffc89d955e20b91d1014
# https://medium.com/@suchitra9049/rspec-test-df18feac0690
# https://rubyyagi.com/rspec-request-spec/
# https://ryota21silva.hatenablog.com/entry/2020/07/26/121801
# https://zenn.dev/hrk_sgyumm23/articles/a824519c303ea5
require 'rails_helper'

RSpec.describe "/todos", type: :request do
  # [【Rails/Rspec】リクエストスペックでAPIをテストする際に、よくやること - Funna(ふんな)の技術ブログ](https://ryota21silva.hatenablog.com/entry/2020/07/26/121801#:~:text=let%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%80%81headers%E6%83%85%E5%A0%B1%E3%82%92%E6%A0%BC%E7%B4%8D%E3%81%97%E3%81%A6%E3%81%8A%E3%81%8F%E3%80%82)
  # let(:valid_headers) {{'Content-Type': 'application/json', 'Accept': 'application/json'}}

  describe "GET /index" do
    let!(:todos){ create_list(:todo, 2) }

    it "リクエストが成功すること(200)" do
      get todos_url
      # expect(response.status).to eq 200
      expect(response).to have_http_status :ok
    end

    it "jsonで値が返却されること" do
      get todos_url
      expect(response.body).to eq(todos.to_json)
    end

    it "指定されたレコード数が返却されること" do
      get todos_url
      # 以下の書き方はRuboCopに怒られる
      # json = JSON.parse(response.body)
      json = response.parsed_body
      expect(json.length).to eq(2)
    end
  end

  describe "GET /show" do
    let!(:todo) { create(:todo, title: "show title") }

    it "リクエストが成功すること(200)" do
      get todo_url(todo)
      expect(response).to have_http_status :ok
    end

    it "jsonで値が返却されること" do
      get todo_url(todo)
      expect(response.body).to eq(todo.to_json)
    end

    it "指定したレコードが返却されること" do
      get todo_url todo
      json = response.parsed_body
      expect(json["title"]).to eq(todo.title)
    end
  end

  describe "POST /create" do
    context "パラメーターが有効のとき" do
      it "リクエストが成功すること(201)" do
        post todos_url, params: { todo: attributes_for(:todo)}
        expect(response).to have_http_status :created
      end

      it "todoが登録されること" do
        expect do
          post todos_url, params: { todo: attributes_for(:todo)}
        end.to change(Todo, :count).by(1)
      end
    end

    context "パラメーターが無効のとき" do
      it "リクエストが成功すること(422)" do
        post todos_url, params: { todo: attributes_for(:todo, :invalid)}
        expect(response).to have_http_status :unprocessable_entity
      end

      it "todoが登録されないこと" do
        expect do
          post todos_url, params: { todo: attributes_for(:todo, :invalid)}
        end.to change(Todo, :count).by(0)
      end
    end
  end

  describe 'PATCH #update' do
    let!(:todo) { create(:todo, description: "description", status: :not_completed, title: "show title") }

    context "パラメーターが有効のとき" do
      it "リクエストが成功すること" do
        put todo_url todo, params: { todo: attributes_for(:todo, title: "show title changed")}
        expect(response).to have_http_status :ok
      end

      it "desciptionが更新されること" do
        expect do
          put todo_url todo, params: { todo: attributes_for(:todo, description: "description changed")}
        end.to change { Todo.find(todo.id).description }.from('description').to('description changed')
        # 以下のような書き方もできるらしい
        # https://g.co/gemini/share/324f48030b66
        # put todo_url todo, params: { todo: attributes_for(:todo, description: "description changed")}
        # todo.reload
        # expect(todo.description).to eq "description changed"
      end

      it "statusが更新されること" do
        expect do
          put todo_url todo, params: { todo: attributes_for(:todo, status: :completed)}
        end.to change { Todo.find(todo.id).status }.from("not_completed").to("completed")
        # enumで以下のような書き方だとダメ
        # [Railsのenumを使いこなす方法（翻訳）｜TechRacho by BPS株式会社](https://techracho.bpsinc.jp/hachi8833/2022_02_18/115735#:~:text=%E3%82%B9%E3%83%86%E3%83%BC%E3%82%BF%E3%82%B9%E3%81%8Cpublished%E3%81%AEpost%E3%82%92%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B)
        # expect do
        #   put todo_url todo, params: { todo: attributes_for(:todo, status: :completed)}
        # end.to change { debugger }.from(:not_completed).to(:completed)
      end

      it "titleが更新されること" do
        expect do
          put todo_url todo, params: { todo: attributes_for(:todo, title: "show title changed")}
        end.to change { Todo.find(todo.id).title }.from('show title').to('show title changed')
      end
    end

    context "パラメーターが無効のとき" do
      it "リクエストが成功すること" do
        put todo_url todo, params: { todo: attributes_for(:todo, :invalid)}
        expect(response).to have_http_status :unprocessable_entity
      end

      it "todoが更新されないこと" do
        expect do
          put todo_url todo, params: { todo: attributes_for(:todo, :invalid)}
        end.not_to change(Todo.find(todo.id), :description)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:todo) { create(:todo) }

    it "リクエストが成功すること(204)" do
      delete todo_url todo
      expect(response).to have_http_status :no_content
    end

    it 'todoが削除されること' do
      expect do
        delete todo_url todo
      end.to change(Todo, :count).by(-1)
    end
  end
end
