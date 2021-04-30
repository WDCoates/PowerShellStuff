#NuGet Commands
nuget locals all -list

nuget locals global-packages -list

nuget locals global-packages -clear

# %AppData%\NuGet\NuGet.Config
nuget config -AsPath global-package


# Versioning is important 1.0.0...
# After Build and Pack
nuget add *.*.9.9.9.nupkg -source D:\Development\MyPackageCollection

nuget add ThePackage.1.0.0.nupkg -source D:\Development\MyPackageCollection\ 


