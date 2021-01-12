# underpin -split & -match operators, the switch statement and Select-String command

# . Any character except newline match single character at a time

"ZYX." -match '.'   # 4 Matches....

# [] Any char in brackets
"Test" -match '[aeiou]'
"XYZ"  -match '[aeiou]'

# [^] Any char NOT in brackets
"Test" -match '[^Test]'
"XYZ"  -match '[^aeiou]'

# [A-G] Range and ^ NOT it again
"Test" -match '[A-G]'
"XYZ"  -match '[^W-Z]'

# \p{ } Any character in the Unicode group or block range specified by {character class}.
"+"   -match '\p{Sm}'
"+£1" -match '.\p{Sc}.'
# http://www.regular-expressions.info/unicode.html  has a good list....

# \P{}  Any chat NOT in Unicode group...
"+£1" -match '.\P{Sc}.'

# \w Any Unicode definition of a word so digits and symbols included
"Am4n" -match '\w'  # True
"123." -match '\w'  # True
"..."  -match '\w'   # False

# \W Any NONE word charater
"!?." -match '\W'   # True

# \s Any WhiteSpace character & \S None WhiteSpace...
"`t" -match '\s'    # True this is the Tab Char
"`t" -match '\S'    # False this is the Tab Char

# \d Any decimal digit and \D None decimal digit
"1"   -match '\d'     # True
"1"   -match '\D'     # False
"M4N" -match '.\D.'     # False

# ^ Match at beginning
# $ Match at the end

# Quantifiers....
# Matching as much as possible...
# * 0 or More
# + 1 or more
# ? 0 or 1
"XXX"  -match 'X+';      $Matches #True
"TTT" -match '^T.*$';    $Matches #True 
"TTTA" -match 'T.*$';    $Matches #True 
"TATTT" -match '^TA*$';  $Matches #False 
"TA"    -match '^TA$';   $Matches #True
"TATTA" -match '^TA.*$'; $Matches #True

'TTATT' -match 'T'; $Matches.Count
'TTTT' -match '^T+$'

# {n} Exactly n matches
"TTTT" -match '^T{4}$'; $Matches   #True
"TTTT" -match '^T{2}$'; $Matches   #False
"TTTT" -match '^T{2}';  $Matches   #True

# {n, } n or more 
"TTTT" -match '^T{2,}$';  $Matches   #True
"TTTT" -match '^T{2,}';   $Matches   #True

# {n,m} Between n and m matches
"TTTT" -match '^TT{3,10}';   $Matches   #True
"TTTT" -match '^TT{4,10}';   $Matches   #False

# All matching to this point are matching as much as possible..
# ? makes it matching as little as possible...

# *? 0 or more
"A" -match '^AT*?$'; $Matches           #True Matches the A but doesn't need to match the T
'ATTATT' -match 'AT*?'; $Matches.Count  #True but only one match!

# +? 1 or more
"A" -match '^AT+?$'; $Matches           #False
'ATTATT' -match '^AT+?'; $Matches.Count  #True but only one match!

# ??, {n}?, {n,m}?...

# Grouping constructs
"Hello Wollo" -match '^(.*)llo$'; $matches

