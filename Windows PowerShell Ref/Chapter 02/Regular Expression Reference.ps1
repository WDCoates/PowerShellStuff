# underpin -split & -match operators, the switch statement and Select-String command

# . Any character exceot newline match single character at a time

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

# \s Any WhiteSpace charater & \S None WhiteSpace...
"`t" -match '\s'    # True this is the Tab Char
"`t" -match '\S'    # False this is the Tab Char

# \d Any decimal digit and \D None decimal digit
"1"   -match '\d'     # True
"1"   -match '\D'     # False
"M4N" -match '.\D.'     # False

# Quantifiers....