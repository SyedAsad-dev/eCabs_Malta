# InstaFeed
Swift Assessment Test 

## Known issues/limitations
* limitation=> max 20 videos cache.

## Building And Running The Project (Requirements)
* Swift 6.0+
* SwiftUI
* Xcode 16.2+
* iOS 17+
* MacOS Sequoia 15.3.1

# Getting Started
- If this is your first time encountering swift/ios development, please follow [the instructions](https://developer.apple.com/support/xcode/) to setup Xcode and Swift on your Mac.


## Setup Configs
- Checkout main branch to run latest version
- Open the project by double clicking the `instafeed.xcodeproj` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app
```
// App Settings
APP_NAME = instafeed
PRODUCT_BUNDLE_IDENTIFIER = instafeed.Task.instafeed

#targets:
* instafeed
```


# Build and or run application by doing:
* Select the build scheme which can be found right after the stop button on the top left of the IDE
* [Command(cmd)] + B - Build app
* [Command(cmd)] + R - Run app


## Accomplished:
- Interface Modularization.
- Composite Root technique.
- SOLID principle.
- MVVM Architecture.
- Observable Macro + other Reactive Programming technique.
- Async/Await.

Kingfisher implementation for images as third party library.

## Architecture
This application uses the MVVM UI architecture with modular approach.

<p align="center"> <img src="https://miro.medium.com/v2/resize:fit:1400/1*saKX3Dssawi-Z4zT0mNRmQ.png" width="600" height="300">

<img src="https://miro.medium.com/v2/resize:fit:1400/1*lR0AqgxKy5H7bFFQbYQeeA.png" width="600" height="300">
</p>

## Structure

### Presentation
- Include Feeds.

### Domain
- Include Entities, RepositoryProtocols, UseCases, UseCasesProtocols, VideoPreloaderConfig.

### Data
- Include DataSource, Repositories.

### Navigator Panel
<p align="center"> 
<img src="https://github.com/user-attachments/assets/e907e9a7-6011-4916-8199-9d6f1811e482" width="400" height="500">
</p>

### Graph View

<p align="center"> 
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmo0oI5yIKJkk4M8nlseHz1xltdcg7VS4Msg&s" width="250" height="250">
</p>
