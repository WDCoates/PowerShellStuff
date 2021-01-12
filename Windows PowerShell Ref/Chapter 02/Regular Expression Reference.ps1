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

# Capture and name
"Hello" -match '^(?<H1>.*)llo$'; $matches.H1

# (?:) Non-capturing group
"A2" -match '((A|B)\d)'; $matches
"A1" -match '(?:(A|B)\d)'; $matches
"A1" -match '((?:A|B)\d)'; $matches



# (?imnsx-imnsx:) i case-insensitive, m multi-line, n explicit capture, s single-line, x ignore whitespace

"Te`nst" -match '(T e.st)' # False
"Te`nst" -match '(?sx:T e.st)'; $Matches # True

# (?=) Zero-width positive lookahead assertion.
"4321-567890" -match '(?=...-)(.*)'; $matches[1]    # True 321-567890

# (?!) Zero-width negative lookahead assertion.
"Friend is Friend" -match 'Friend';             $matches    # True
"Friend is Friend" -match '(?!.*is.*)Friend.*'; $matches    # True 
"Friendly" -match '(?!Friendly)Friend.*';       $matches    # False


# (?<=) Zero-width positive lookbehind assertion.
"public int X" -match '^.*(?<=public )int .*$'; $Matches # True

# (?<!) Zero-width negative lookbehind assertion.
"public int X" -match '^.*(?<!public )int .*$'; $Matches # False
"private int X" -match '^.*(?<!public )int .*$'; $Matches # True 

# (?>) Non-backtracking subexpression. Matches only if this subexpression can be matched completely.

"Hello World" -match '(Hello.*)orld'; $Matches  # True two matches
"Hello World" -match '(?>Hello.*)orld'; $Matches # False
"This is Hello World my friend" -match '(Hell.*)World'; $Matches # True
"This is Hello World my friend" -match 'Hell.*'; $Matches # True Hello World my friend
"This is Hello World my friend" -match '(?>Hell.*).*World'; $Matches # False

# Atomic zero-width assertions or restrict where patterns must occur

# ^ Beginning or string/line
# $ End of string/line

# \A Beginning or string.
"The`nTest" -match '(?m:^Test)' # True  `n new line...
"The`nTest" -match '(?m:\ATest)' # False

# \Z End of String or before \n
"One`nTwo`nThree`n" -match '(?m:Two$)' #True
"One`nTwo`nThree`n" -match '(?m:Two\Z)' #False
"One`nTwo`nThree`n" -match 'Three\Z' #True

# \z End of string
 "One`nTwo`nThree`n" -match 'Three\z' #False

# \b must occur on a word boundary
"Testing123" -match '123\b' # True
"123Testing456" -match '\b123' # True

# \B Must Not occur on a word boundary
"Testing123456" -match '123\B' # True
"123Testing456" -match '\B123' # False


# \G Match must occur where previous match ended. Used with Match.NextMatch()
