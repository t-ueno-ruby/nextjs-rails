# https://qiita.com/naoki_mochizuki/items/1d3026a32786642fc762#%E5%88%9D%E6%9C%9F%E8%A8%AD%E5%AE%9A%E4%B8%80%E8%A6%A7
RSpec.configure do |config|
  # FactoryBotの呼び出し簡略化
  config.include FactoryBot::Syntax::Methods

  # springが原因でfactoryが正しく読み込まれないことを防ぐ
  # config.before :all do
  #   FactoryBot.reload
  # end
end
