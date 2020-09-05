<# 
    Auther: DCoates
#>

# Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170906_1410 Alter Table TB_FlashingSpecs.sql" -SuppressProviderContextWarning
# Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170926_1500 Alter TB_Dependencies Extend column FilterGroup.sql" -SuppressProviderContextWarning
# Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk2\Database\Migrations\2017\20171004 1521 Add SP_ProductsOnOrder Stored Procedure.sql" -SuppressProviderContextWarning

# Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170906_1410 Alter TB_FlashingSpecs Data.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170907 1004-Update EmailQuotation asset.sql" -SuppressProviderContextWarning

# Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170907-1623 NewDeliverySupplier.sql" -SuppressProviderContextWarning
# Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170907-1623 NewDeliverySupplier-02-CostWeightBands.sql" -SuppressProviderContextWarning
# Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170907-1623 NewDeliverySupplier-02-FeeWeightBands.sql" -SuppressProviderContextWarning

Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170911_1430 Triton Pricing Updates.sql" -SuppressProviderContextWarning
# Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170925_0900 27156 Create New Delivery Method Data Struct.sql" -SuppressProviderContextWarning


Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170926-1230 AluGrid-EastWest-Dependencies.sql" -SuppressProviderContextWarning

#In Live From 2017-10-12 17:20
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170928 1451 BE-00-Add PZone Costs  and Named Regions.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170928 1452 BE-01-Update CostWeightBands.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170928 1453 BE-01-Update FeeWeightBands.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170928 1454 NL-00 Add PZone Costs  and Named Regions.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170928 1455 NL-01-Update CostWeightBands.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20170928 1456 NL-01-Update FeeWeightBands.sql" -SuppressProviderContextWarning

#Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\AluGrid Plus NS Prod Brands.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20171003 0844 AluGridPlus NS Dependencies Data.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20171026 1620 26354 AluGridPlus EW Dependencies Data.sql" -SuppressProviderContextWarning

#In Live From 2017-10-17 
Invoke-Sqlcmd -Database SegenResourceDB -HostName HELIOS -InputFile "D:\Development\Segen\Trunk\Database\Migrations\2017\20171016 1700 27418 New RuleSet and FormatRules.sql" -SuppressProviderContextWarning
