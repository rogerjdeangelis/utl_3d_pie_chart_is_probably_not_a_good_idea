3D pie chart is probably not a good idea?

github
https://tinyurl.com/yd8ghltb
https://github.com/rogerjdeangelis/utl_3d_pie_chart_is_probably_not_a_good_idea

see
https://tinyurl.com/y9aj7bz9
https://communities.sas.com/t5/General-SAS-Programming/piechart-overlapping-values/m-p/473268


Perhaps 3D piecharts are not the best way to display your data?
Maybe 3D pie charts should never be used?

Many times it is hard to beat a well designed table?

PROBLEM
======

* make data;
data prdsale;
  set sashelp.prdsale;
  if uniform(1234)<.5;
run;quit;


options ls=64 ps=44;
PROC CHART DATA=prdsale;
format month monyy.;
PIE month /  type= percent;
RUN;
QUIT;

PROBLEM

 Line printer rendering of Ops 3D pie chart


                         MAY93
                         ***********  APR93
             JUL93  *****     .     *****
                  **    ..    .          **
                **       .    .          . **
       SEP93  **.         4.94%         .    **  FEB93
             *   .        .   . 9.05% ..       *
           **     .  7.54% .  .      .          **
          ** ..     ..     .  .     .            **
          *     .3.84%.     . .    .  10.01%      *
   OCT93 *         ..  ..   . .    .          .. . *
         *    7.82%   .. .   ..  ..       . .      *  DEC92
        **              . .. .. .     .. .5.76%    **
        * . .. . .         ..    . ..               *
        *         . . .. . .  +  . . .. . .. . .. . *
        *     7.41%      . .     . . .. ..3.29%     * Other
  DEC93 **           .. . .  . .  .        . .. . .**
         *        ..    ..  .  ..  ..              *
         *   . ..     .    .   . .    .  7.96%     *
          * .   4.80%.     .   . ..    ..         *
          **     . .     ..     .  .     . .     ** OCT94
     FEB94  *   .  7.41% .      .  . 7.13%  .   *
             * .        .       3.84%        . *
              **       .  9.19%  .   .       **
                **     .         .   .     **
           MAR94  **  .          .    .  **  AUG94
                    *****        .  *****
                         ***********  JUL94
                         MAY94


SOLUTION?

* in classic SAS the symbol '93'x is nice, histogram looks more solid.
hbar month /symbol='93'X  descending  ;

options ls=80 ps=66;
proc chart data=prdsale;
format month monyy.;
hbar month /symbol='M'  descending  ;
run;quit;


PRDSALE total obs=1,440

Month                                                 Cum.              Cum.
Midpoint                                        Freq  Freq  Percent  Percent
        |
FEB93   |MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    73    73    10.01    10.01
        |
MAY94   |MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM       67   140     9.19    19.20
        |
APR93   |MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM        66   206     9.05    28.26
        |
OCT94   |MMMMMMMMMMMMMMMMMMMMMMMMMMMMM            58   264     7.96    36.21
        |
OCT93   |MMMMMMMMMMMMMMMMMMMMMMMMMMMMM            57   321     7.82    44.03
        |
JUL93   |MMMMMMMMMMMMMMMMMMMMMMMMMMMM             55   376     7.54    51.58
        |
MAR94   |MMMMMMMMMMMMMMMMMMMMMMMMMMM              54   430     7.41    58.98
        |
DEC93   |MMMMMMMMMMMMMMMMMMMMMMMMMMM              54   484     7.41    66.39
        |
AUG94   |MMMMMMMMMMMMMMMMMMMMMMMMMM               52   536     7.13    73.53
        |
DEC92   |MMMMMMMMMMMMMMMMMMMMM                    42   578     5.76    79.29
        |
MAY93   |MMMMMMMMMMMMMMMMMM                       36   614     4.94    84.22
        |
FEB94   |MMMMMMMMMMMMMMMMMM                       35   649     4.80    89.03
        |
JUL94   |MMMMMMMMMMMMMM                           28   677     3.84    92.87
        |
SEP93   |MMMMMMMMMMMMMM                           28   705     3.84    96.71
        |
NOV94   |MMMMMMMMMMMM                             24   729     3.29   100.00
        |
        -----+----+----+----+----+----+----+--
             10   20   30   40   50   60   70

                       Frequency




