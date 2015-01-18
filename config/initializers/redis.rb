$redis = Redis.new(:driver => :hiredis)

$redis = Redis.new(:url => ENV['REDISTOGO_URL'])
