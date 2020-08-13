// system "p 9000";

// `DEVELOPER_HOME setenv "/home/fidel/miniconda3/envs/kdb/q/developer";
// `DEVELOPER_DATA setenv "/home/fidel/miniconda3/envs/kdb/q/developer/data";
// `DEVELOPER_PORT setenv "9001"

// system "l /home/fidel/miniconda3/envs/kdb/q/developer/launcher.q_"
system "l /home/fidel/Source/andromeda/data/sharadar/";
system "l /home/fidel/miniconda3/envs/andromeda/q/ml/ml.q";
.ml.loadfile`:/util/init.q;

piv:{[t;k;p;v;f;g]
 f:{[v;P]`$raze each string raze P[;0],'/:v,/:\:P[;1]}
 g:{[k;P;c]k,(raze/)flip flip each 5 cut'10 cut raze reverse 10 cut asc c}
 v:(),v;
 G:group flip k!(t:.Q.v t)k;
 F:group flip p!t p;
 count[k]!g[k;P;C]xcols 0!key[G]!flip(C:f[v]P:flip value flip key F)!raze
  {[i;j;k;x;y]
   a:count[x]#x 0N;
   a[y]:x y;
   b:count[x]#0b;
   b[y]:1b;
   c:a i;
   c[k]:first'[a[j]@'where'[b j]];
   c}[I[;0];I J;J:where 1<>count'[I:value G]]/:\:[t v;value F]}

eqReturns:{[start; end]
 t: select date, close, ticker from SEP where date within (start; end);
 c: asc exec distinct ticker from t;
 t: exec c#(ticker!close) by date:date from t;
 t: 1_deltas t;
 t}

eqCorr:{[start; end] .ml.corrmat delete date from 0!eqReturns[start; end] }

eqfun:{[indicator; start; end]
t: select ticker, calendardate, indicator from SF1 where calendardate within (start;end);
c: asc exec distinct ticker from t;
t: exec c#(ticker!close) by date:date from t;
t}

// qd.sharadar.build: {[x] (`$("",/(":C:/Source/andromeda/data/sharadar/"; string x))) set ((string sharadarEncodings[x]; enlist ",")0: `$("",/(":C:/Source/andromeda/data/sharadar/SHARADAR_";string x;".csv")))};
// {[x] if[0b<>()~key `$":C:/Source/andromeda/data/sharadar/",string x ; .qd.sharadar.build x]} peach key sharadarEncodings;

// .qd.nasdaqomx.build:{[x] (`$("",/(":C:/Source/andromeda/data/nasdaqomx/"; string x))) set ((string nasdaqomxEncodings[x]; enlist ",")0: `$("",/(":C:/Source/andromeda/data/nasdaqomx/";string x;".csv")))};
// {[x] if[0b<>()~key `$":C:/Source/andromeda/data/nasdaqomx/",string x ; .qd.nasdaqomx.build x]} peach key nasdaqomxEncodings;

// .qd.fred.build:{[x] (`$("",/(":C:/Source/andromeda/data/fred/"; string x))) set ((string fredEncodings[x]; enlist ",")0: `$("",/(":C:/Source/andromeda/data/fred/";string x;".csv")))};
// {[x] if[0b<>()~key `$":C:/Source/andromeda/data/fred/",string x ; .qd.fred.build x]} peach key fredEncodings;




// sharadarEncodings: (`SF1;`SF2;`SF3;`SF3A;`SF3B;`SEP;`TICKERS;`INDICATORS)!(`SSDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;`SDSSSSSSSDSSFFFFFSSSDFFF;`SSSDFFF;`DSSFFFFFFFFFFFFFFFFFFFFFFFFFFF;`DSFFFFFFFFFFFFFFFFFFFFFFFFFF;`SDFFFFFFFD;`SSSSSSSSSSSSSSSSSSSSDDDDDDSS;`SSSSSSS);

// qd.sharadar.build: {[x] (`$("",/(":/home/fidel/kdb/sharadar/"; string x; "/"))) set ((string sharadarEncodings[x]; enlist ",")0: `$("",/(":/home/fidel/kdb/sharadar/SHARADAR_";string x;".csv")))};
// {[x] if[0b<>()~key `$":/home/fidel/kdb/sharadar/",string x ; qd.sharadar.build x]} peach key sharadarEncodings;


// qd.sharadar.build: {[x] .Q.en[(`$("",/(":/home/fidel/Source/andromeda/data/sharadar/"; string x))); ((string sharadarEncodings[x]; enlist ",")0: `$("",/(":/home/fidel/Downloads/SHARADAR_";string x;".csv")))]};
// {[x] if[0b<>()~key `$":/home/fidel/Source/andromeda/data/sharadar/",string x ; qd.sharadar.build x]} each key sharadarEncodings;
