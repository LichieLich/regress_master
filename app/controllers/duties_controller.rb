class DutiesController < ApplicationController
  def index
    week_start = DateTime.now.beginning_of_week
    week_end = DateTime.now.end_of_week

    @previous_week_duties = Duty.where(date: (week_start - 1.week)..week_start)
    @current_week_duties = Duty.where(date: week_start..week_end)
    @future_week_duties = Duty.where(date: week_end..(week_end + 1.week))

    @duties = Duty.where(date: (week_start - 1.week)..(week_end + 2.week))

    until Duty.order(date: :desc).first.date >= week_end + 7.days do
      assign_duties
    end
  end

  # Убрать в джобу
  def assign_duties
    sack = Sack.first_or_create
    period_start = Duty.any? ? Duty.order(date: :desc).first.date + 1.day : DateTime.now

    day_counter = 0
    users = sack.users
    until users.empty? do
      is_working = RestClient.get("https://isdayoff.ru/#{(period_start + day_counter.day).strftime('%Y%m%d')}?cc=ru").body
      # 0 рабочий, 1 нерабочий
      user = users.sample
      assignee = is_working == '0' ? user : nil
      Duty.create date: period_start + day_counter.day, user: assignee

      day_counter += 1
      users.delete user if is_working == '0'
    end
   
    sack.users = User.all
  end
  
  # Переназначить пользователя
  def update
  end

  # Убрать пользователя из дежурства
  def remove_user
  end
end
