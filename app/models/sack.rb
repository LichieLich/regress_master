# Очередь из пользователей, которые ожидают распределение на дежурство для равномерного распределения
class Sack < ApplicationRecord
  has_many :users
end
