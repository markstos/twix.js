(function() {
  var lang;

  lang = function(moment, Twix) {
    var before;
    before = moment.lang();
    Twix.registerLang("fr", {
      twentyFourHour: true,
      allDayMonth: {
        fn: function(options) {
          return function(date) {
            return date.format("" + options.dayFormat + " " + options.monthFormat);
          };
        },
        slot: 3
      },
      month: {
        slot: 3
      },
      date: {
        slot: 2
      }
    });
    Twix.registerLang("fr-ca", {
      twentyFourHour: true,
      allDayMonth: {
        fn: function(options) {
          return function(date) {
            return date.format("" + options.dayFormat + " " + options.monthFormat);
          };
        },
        slot: 3
      },
      month: {
        slot: 3
      },
      date: {
        slot: 2
      }
    });
    return moment.lang(before);
  };

  if ((typeof module !== "undefined" && module !== null) && (module.exports != null)) {
    module.exports = lang;
  }

  if (typeof define === "function" && define.amd) {
    define(["moment", "twix"], function(moment, Twix) {
      return lang(moment, Twix);
    });
  }

  if (this.Twix && this.moment) {
    lang(this.moment, this.Twix);
  }

}).call(this);