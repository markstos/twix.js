Twix is a simple but opinionated JS library for working with date ranges, and includes a customizable smart formatter. It's written in CoffeeScript and it depends on [Moment.js](http://momentjs.com/).

```js
var t = moment("1982-01-25T09:30").twix("1982-01-25T13:30");

t.format();  //=> Jan 25, 1982, 9:30 AM - 1:30 PM

t.isSame("day"); //=> true
t.humanizeLength(); //=> "4 hours"
t.count("days"); //=> 1
```

See the [docs](docs.html) for more.
