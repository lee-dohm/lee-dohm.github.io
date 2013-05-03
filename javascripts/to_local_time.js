(function($) {
    /*
     * A handy jQuery wrapper for converting tags with JavaScript parse()-able
     * time-stamps into locale-aware time strings.
     *
     * Usage:
     *   Suppose numerous Date.parse()-able time-stamps are available in the
     *   inner-HTML of some <span class="local"> elements...
     *
     *   $("span.local").toLocalTime()
     */
    $.fn.toLocalTime = function() {
      this.each(function() {
        var $this = $(this);
        $this.text(Date.fromString($this.html()).toLocaleString());
      });
    };
  })(jQuery);
