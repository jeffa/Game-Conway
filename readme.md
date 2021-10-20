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
* YAML
* Dancer
* Template
* Spreadsheet::HTML
* Encode::Wechsler
```
cpanm YAML Dancer Template Spreadsheet::HTML Encode::Wechsler
```
