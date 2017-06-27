require 'icalendar'

PATH = "< path/to/ics/file/here >"

cal_file = File.open(PATH)

cals = Icalendar::Calendar.parse(cal_file)

cal_file.close

cal = cals.first

events = []

cal.events.each_with_index { |event, i|
  events[i] = {
    start_time: event.dtstart.to_date,
    end_time: event.dtend.to_date,
    stamp_time: event.dtstamp.to_date,
    created_at: event.created.to_date,
    last_modified: event.last_modified.to_date,
    name: event.summary.to_s,
    calendar: cal.x_wr_cal_name
  }
}

puts events.last
