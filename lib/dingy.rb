def format_remaining_time now, ring_time
  format_time(remaining_time(ring_time, now))
end
def remaining_time ring_time, now
  require 'time'
  Time.parse(ring_time)-Time.parse(now)
end
def format_time time
  return "Rang!" if time < 0
  '%02d:%02d' % [time/60, time%60]
end

