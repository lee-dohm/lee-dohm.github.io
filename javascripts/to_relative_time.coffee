---
---

$.fn.extend
  toRelativeTime: ->
    @each () ->
      $(this).text(Date.fromString($(this).html()).toRelativeTime())
