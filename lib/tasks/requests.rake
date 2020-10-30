namespace :requests do
  desc "Удаление записей из БД недельной давности"
  task delete_7_days_requests: :environment do
    puts "I LAUNCHED!!!"
    # Request.where(['created_at' < '?', 7.days.ago]).destroy_all
  end
end
