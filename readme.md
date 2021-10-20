Game-Conway
===================
Conway's Game of Life implemented with [Spreadsheet::HTML](https://metacpan.org/pod/Spreadsheet::HTML)

Synopsis
--------
Launch application to [local port 3000](http://localhost:3000)

```
perl bin/app.pl
```

Change port with -p
```
perl bin/app.pl -p 3001
```

Requires
--------
* Dancer
* Template
* Spreadsheet::HTML
* Encode::Wechsler
* Color::Spectrum
```
cpanm Dancer Template Spreadsheet::HTML Encode::Wechsler Color::Spectrum
```
