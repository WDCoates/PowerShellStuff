Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170906_1410 Alter Table TB_FlashingSpecs.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170926_1500 Alter TB_Dependencies Extend column FilterGroup.sql" -SuppressProviderContextWarning

Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\Segen\Trunk2\Database\Migrations\2017\20171004 1521 Add SP_ProductsOnOrder Stored Procedure.sql" -SuppressProviderContextWarning



Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170906_1410 Alter TB_FlashingSpecs Data.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170907 1004-Update EmailQuotation asset.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170907-1623 NewDeliverySupplier.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170907-1623 NewDeliverySupplier-02-CostWeightBands.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170907-1623 NewDeliverySupplier-02-FeeWeightBands.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170911_1430 Triton Pricing Updates.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170925_0900 27156 Create New Delivery Method Data Struct.sql" -SuppressProviderContextWarning
Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\20170926-1230 AluGrid-EastWest-Dependencies.sql" -SuppressProviderContextWarning

Invoke-Sqlcmd -Database SegenResourceDB_T2 -HostName HELIOS -InputFile "D:\Development\SQL Scripts\Segen\Update Scripts\AluGrid Plus NS Prod Brands.sql" -SuppressProviderContextWarning