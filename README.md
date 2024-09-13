# eCabs_Malta
Swift Assessment Test 

## Building And Running The Project (Requirements)
* Swift 5.0+
* SwiftUI + UIKit 
* Xcode 15.4+
* iOS 17+
* MacOS Sonoma 14.6.1

# Getting Started
- If this is your first time encountering swift/ios development, please follow [the instructions](https://developer.apple.com/support/xcode/) to setup Xcode and Swift on your Mac.


## Setup Configs
- Checkout master branch to run latest version
- Open the project by double clicking the `EcabTask.xcodeproj` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app
```
// App Settings
APP_NAME = EcabTask
PRODUCT_BUNDLE_IDENTIFIER = ecab.Task.EcabTask

#targets:
* EcabTask
 * EventList
   * EventListTests
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
- Combine + other Reactive Programming technique.
- Async/Await.
- Unit Tests.
- Dark mode support.
- Multiple devices support.

Kingfisher implementation for images as third party library.

## Architecture
This application uses the MVVM UI architecture with modular approach.

<p align="center"> <img src="https://miro.medium.com/v2/resize:fit:1400/1*saKX3Dssawi-Z4zT0mNRmQ.png" width="600" height="300">

<img src="https://miro.medium.com/v2/resize:fit:1400/1*lR0AqgxKy5H7bFFQbYQeeA.png" width="600" height="300">
</p>

## Structure

### Presentation
- Include EventList, EventDetail.

### Domain
- Include Entities, RepositoryProtocols, UseCases, UseCasesProtocols.

### Data
- Include EventListServiceRepository, NetworkingAppDefault, StructuredNetwork, Builder etc.

### Navigator Panel
<p align="center"> 
<img src="https://github.com/user-attachments/assets/0d94f053-1feb-42a8-95f1-5cb3b45ea5c2" width="558" height="500">
</p>

### Graph View

<p align="center"> 
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmo0oI5yIKJkk4M8nlseHz1xltdcg7VS4Msg&s" width="250" height="250">
</p>

## Performance States
Memory usage:

<p align="center"> 
<img src="https://github.com/user-attachments/assets/10f647d1-24dd-4bc6-9f89-8023dcb33698" width="900" height="450">
</p>

Memory Leaks:

<p align="center"> 
<img src="https://github.com/user-attachments/assets/284b65d5-9c2f-4c20-827c-61987e8d080d" width="900" height="80">
</p>

## Multiple devices support => Screen shots:

### Dark mode
iPhone 15 Pro
<p align="center"> 
<img src="https://github.com/user-attachments/assets/0339190f-bcab-41d9-88c0-f9fbd3bf4818" width="250" height="500">

<img src="https://github.com/user-attachments/assets/8b14e50a-6909-4b64-ae13-f218b8a13820" width="250" height="500">

<img src="https://github.com/user-attachments/assets/53785b43-9af1-465b-a2de-1da63dcfbf8e" width="250" height="500">
</p>

iPad mini (6th generation)
<p align="center"> 
<img src="https://github.com/user-attachments/assets/f92674e9-abcd-42cf-9be0-ef20af78c975" width="350" height="560">

<img src="https://github.com/user-attachments/assets/d46ee283-03bc-43e6-8ad6-6a10761721cd" width="360" height="560">
</p>

### Light mode
iPhone 15 Pro
<p align="center"> 
<img src="https://github.com/user-attachments/assets/cf12cf1f-4df8-4a4b-b899-cb5a249df7eb" width="250" height="500">

<img src="https://github.com/user-attachments/assets/933a691b-274b-4a6c-a588-631f6b562b04" width="250" height="500">

<img src="https://github.com/user-attachments/assets/ae8f3351-0e11-4984-9b92-26baa3a203d6" width="250" height="500">
</p>

iPad mini (6th generation)
<p align="center"> 
<img src="https://github.com/user-attachments/assets/086b2982-eab5-4962-928f-d6bd36a63e24" width="350" height="560">

<img src="https://github.com/user-attachments/assets/f5844637-daa8-46af-a16e-f01d359cd030" width="350" height="560">
</p>
