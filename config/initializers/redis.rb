if Rails.env.production?
  $redis = Redis.new(:url => ENV['REDISTOGO_URL'])
else
  $redis = Redis.new(:driver => :hiredis)
end
