every 1.minute do # 1.minute 1.day 1.week 1.month 1.year is also supported
  puts "====================================================Retrieve data by Cron===================================================="
  rake "sync:synchronize_data"

end
