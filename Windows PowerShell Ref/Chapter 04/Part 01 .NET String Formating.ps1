# String Formatting Syntax

# {index[,alignment][:formatString]}

("{0,6}" -f 4.99), ("{0,6:##.00}" -f 15.9)

# demo Index
("{0,6} {1,10}" -f 4.99,100)
("{0,6} {1,20}" -f 4.99,100)

# demo alignment
"------ ------ ------"
("{0,6} {1,0} {2,-6}" -f 'ABC', 'ABC', 'ABC')
("{0,6}" -f 'ABC')  # Right
("{0,0}" -f 'ABC')  # ?
("{0,-6}" -f 'ABC') # Left

# C or c for Currency
"{0,4:C}" -f 4.99

# D or d Decimal
"{0:D4}" -f 123 #0123

# E or e Scientific
"{0:E4}" -f 123 #1.2300E+002

# F or f Fixed-point
"{0:F4}" -f [Math]::PI # 3.1416

# G or g General
"{0:G4}" -f [Math]::PI  # 3.142
"{0:G4}" -f 1MB         # 1.049E+06

# N or n Human readable form of numbers
"{0:N4}" -f 1MB         # 1,048,576.0000

# P or p Percent
"{0:P4}" -f 0.56        # 56.0000%

# R or r Roundtrip  - not sure what this is giving us!
1MB                         # 1048576
1MB / 0.77                  # 1361787.01298701
1361787.01298701 * 0.77     # 1048576 

"{0:R}" -f (1MB/0.33)       # 3177503.0303030303
3177503.0303030303 * 0.33   # 1048576 

# X or x Hexadecimal
"{0:X4}"    -f 1234  # 04D2

# Custom Numerics
# 0 Zero placeholder
"{0:000}" -f 12     # 012

# # Digit placeholder digit being 1-9 after rounding also can use '.' ',' ',,' '%' 'E..'
"{0:.##}" -f 1.123456   # 1.12
"{0:.##}" -f 0.123456   # .12
"{0:.##}" -f 0.104      # .1
"{0:.##}" -f 0.109      # .11

# 'Text' Literal string
"{0:'%%' 0.## '%%'}" -f 0.109      # %% 0.11 %%

# ; Section separator   POS;NEG;ZERO
"{0:Yes;No}" -f  1     # Yes
"{0:Yes;No}" -f -1     # No
"{0:Yes;No}" -f  0     # Yes

"{0:Yes;No;Bingo}" -f  0     # Bingo
