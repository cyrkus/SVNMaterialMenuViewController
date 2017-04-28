[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# SVNMaterialMenuViewController
<p align="center">
  <img src="/images/Earn Menu Copy.png" alt="SVNMaterialButton"/>
</p>

## To use this framework
Create the dataSource:

    SVNMaterialMenuDataSource

Or use the default:

    SVNMaterialMenuCell()

Call:

    init(theme:, dataSource:, nibNameOrNil:, nibBundleOrNil:)

To process selection of cells, equate a method in the presenting class to:

    public var selectedItem: ((Int) -> Void)?

Submodules include:
[SVNTheme](https://github.com/sevenapps/SVNTheme)


## To install this framework

Add Carthage files to your .gitignore

    #Carthage
    Carthage/Build

Check your Carthage Version to make sure Carthage is installed locally:

    Carthage version

Create a CartFile to manage your dependencies:

    Touch CartFile

Open the Cartfile and add this as a dependency. (in OGDL):

    github "sevenapps/PathToRepo*" "master"

Update your project to include the framework:

    Carthage update --platform iOS

Add the framework to 'Linked Frameworks and Libraries' in the Xcode Project by dragging and dropping the framework created in

    Carthage/Build/iOS/pathToFramework*.framework

Add this run Script to your xcodeproj

    /usr/local/bin/carthage copy-frameworks

Add this input file to the run script:

    $(SRCROOT)/Carthage/Build/iOS/pathToFramework*.framework

If Xcode has issues finding your framework Add

    $(SRCROOT)/Carthage/Build/iOS

To 'Framework Search Paths' in Build Settings
