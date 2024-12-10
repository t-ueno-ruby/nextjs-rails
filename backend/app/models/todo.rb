class Todo < ApplicationRecord
  # https://qiita.com/fooramu/items/fce19f443e5770ad2e13#%E3%83%8B%E3%83%A5%E3%83%BC%E3%82%B9
  # https://qiita.com/YumaInaura/items/54024719bd116c47cdd6
  # https://techblog.whitehealthcare.co.jp/entry/2023/11/02/133128
  # https://techracho.bpsinc.jp/hachi8833/2023_09_13/134684#1-4
  # https://techracho.bpsinc.jp/hachi8833/2022_02_18/115735
  # https://techracho.bpsinc.jp/hachi8833/2021_06_17/105107
  enum :status, { not_completed: 0, completed: 1 }, prefix: true, default: :not_completed, validate: true
  validates :description, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 80 }, uniqueness: true
end
