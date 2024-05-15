# Очередь из пользователей, которые ожидают распределение на дежурство для равномерного распределения
class Sack < ApplicationRecord
  has_many :users, autosave: true

  after_initialize do |sack|
      sack.users = User.all
  end

  def next_user
    self.users.sample
  end
end
