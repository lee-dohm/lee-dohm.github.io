---
---

$.fn.extend
  toLocalTime: ->
    @each () ->
      $(this).text(Date.fromString($(this).html()).toLocaleString())
