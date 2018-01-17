class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, counter_cache: true
  #自動回傳sizez方法結果，計算關聯物件的數量
end
