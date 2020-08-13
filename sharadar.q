`.sharadar.ts set get .sharadar.util.loc: `:/home/fidel/kdb/sharadar;
`sharadar set get hsym `$("",/(string .sharadar.util.loc; "/sharadar"));

.sharadar.util.encodings: (`SF1;`SF2;`SF3;`SF3A;`SF3B;`SEP;`TICKERS;`INDICATORS)!(`SSDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;`SDSSSSSSSDSSFFFFFSSSDFFF;`SSSDFFF;`DSSFFFFFFFFFFFFFFFFFFFFFFFFFFF;`DSFFFFFFFFFFFFFFFFFFFFFFFFFF;`SDFFFFFFFD;`SSSSSSSSSSSSSSSSSSSSDDDDDDSS;`SSSSSSS);
.sharadar.util.rawloc: 0N;
.sharadar.util.splay: {[x] .sharadar.util.loc,string x set .Q.ens[.sharadar.util.loc; ((string .sharadar.util.encodings[x]; enlist ",")0: hsym `$("",/(.sharadar.util.rawloc; string x; ".csv"))); `sharadar]};
.sharadar.util.build: {$[0b<>()~key .sharadar.util.loc,string x; .sharadar.util.splay each key .sharadar.util.encodings; 0N]};

.sharadar.getPrice:{[table; dateref; entity; start; end; symbols; column]
  t: ?[table; ((within;dateref;(start; end)); (in;entity;enlist symbols)); 0b; (dateref;entity;column)!(dateref;entity;column)];
  p: value asc ?[t; (); (); (?:;entity)];
  ?[t; (); (enlist dateref)!(enlist dateref); (#;`p;(!;entity;column))]};

.sharadar.filter: {[column; filter; until] ?[.sharadar.ts.TICKERS; ((=;column;enlist filter); (<=;`lastpricedate;until)); (); (?:;`ticker)]};

-1"Loaded [sharadar]";