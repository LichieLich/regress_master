# Модель отвечает за одно дежурство по прогону. Может иметь или не иметь ответственнего пользователя
class Duty < ApplicationRecord
  belongs_to :user, optional: true
end
