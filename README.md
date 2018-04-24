# MobileTworkProjects

Show all of the user's Projects, allow them to choose one, then show some part of the project


## Built with enviroment
- Xcode 9.3
- Swift 4.1
- iOS 11.3


## Project Steup

This project have some dependencies to be installed follow de next steps  

### Carthage Setup

Carthage is intended to be the simplest way to add frameworks to your Cocoa application. 
In my opnion is simpler than Cocoapods, and helps you in the build times using the cached builds.

To install carthage you should run the follow command: 

```shell
brew install carthage
```

After the carthage was installed run the command to generates the frameworks: 

```shell
carthage update --cache-builds --platform ios
```

### Swift lint

To run swift lint on project you should install it:

```shell
brew install swiftlint
```
