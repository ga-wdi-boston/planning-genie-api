require 'icalendar'

PATH = Rails.root.join("public", "cal.ics")

# Open the file and call icalendar parse method on it
cal_file = File.open(PATH)
cals = Icalendar::Calendar.parse(cal_file)
cal_file.close

# ICS files can have multiple calendars, but ours don't,
# so we select only the first calendar
cal = cals.first

events = []

cal.events.each do |e|
  material = {}

  # remove anything inside parenthesis, in our case
  # parens tell us who the material is assigned to
  name = e.summary.gsub(/\(.*\)/, '')
  # remove all whitespace from name
  name = name.gsub(/\s/, '')

  # materials are all lower case, if the name has uppercase
  # letters we dont want it.
  # We also don't want worktime events
  unless /[A-Z]/ =~ name || /worktime/ =~ name
    unique = true

    # Check for duplicates
    events.each do |event|
      if event[:name] === name
        unique = false
      end
    end

    # Set "type" property by looking for the type in
    # the name of the material
    if /project/ =~ name
      material[:type] = "project"
    elsif /diagnostic/ =~ name
      material[:type] = "diagnostic"
    elsif /study/ =~ name
      material[:type] = "study"
    elsif /practice/ =~ name
      material[:type] = "practice"
    elsif /challenge/ =~ name
      material[:type] = "challenge"
    else
      material[:type] = "talk"
    end

    material[:name] = name

    # length is the estimated time to deliver the material in minutes
    material[:length] = ((e.dtend.to_time - e.dtstart.to_time) / 60).to_i

    if unique
      events.push(material)
    end
  end
end

EVENTS_EXPORT = events
