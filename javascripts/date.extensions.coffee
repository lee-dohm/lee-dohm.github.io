Date::toRelativeTime = ->
  delta = new Date() - this
  units = null
  conversions =
    millisecond: 1
    second:      1000
    minute:      60
    hour:        60
    day:         24
    month:       30
    year:        12

  for key, value of conversions
    if delta < value
      break
    else
      units = key
      delta = delta / value

  delta = Math.floor(delta)
  units += "s" if delta isnt 1
  "#{delta} #{units} ago"

Date.fromString = (str) ->
  new Date(Date.parse(str))
