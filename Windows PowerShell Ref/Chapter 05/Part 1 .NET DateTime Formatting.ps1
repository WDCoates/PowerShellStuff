# Date formating only a few ;-) Uses American format!

# d Short D Long Date
"{0:d}" -f [DateTime] "01/02/2021"  # 02/01/2021
"{0:D}" -f [DateTime] "01/02/2021"  # 02 January 2021

# f full date short time, F Full date long time
"{0:f}" -f [DateTime]::Now  # 04 February 2021 09:13
"{0:F}" -f [DateTime]::Now  # 04 February 2021 09:14:17

# lots more lige g,G,R,s,t,T,u,U...
# s sortable!
"{0:s}" -f [DateTime]::Now  # 2021-02-04T09:17:12

# Custom DateTime Formating
# d, dd, ddd, dddd, f, ff, fff, ffff, fffff, ffffff, fffffff
# F, FF, FFF, FFFFFFF, %g or gg, %h, hh, %H, HH, K, m, mm, M, MM, MMM, MMMM, s, ss, t, tt
# y, yy, yyy, yyyy, yyyyy, z, zz, zzz, :, / and "text", %c and other!

"{0:yyyy/MM/dd %h:mm}" -f [DateTime]::Now  # 2021/21/04 9:22