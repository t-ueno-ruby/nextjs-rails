# https://qiita.com/naoki_mochizuki/items/1d3026a32786642fc762#%E5%88%9D%E6%9C%9F%E8%A8%AD%E5%AE%9A%E4%B8%80%E8%A6%A7
# https://qiita.com/30113011tr/items/910e81ed806b0c25be74
require 'shoulda/matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
