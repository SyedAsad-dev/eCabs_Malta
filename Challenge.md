# Technology Assessment

## Overview:

This is a code challenge for prospective iOS Engineers to work for eCabs.
The team will review your project and will discuss it with you: be prepared to explain your
choices.
The team may also ask you to make some changes or to explain how’d you change something
to accomplish a specific goal or request.
Use of Swift is mandatory for this test.

## Expected Goals:

1. The app will have two views: one to show a list of events and one to show the event
details.
2. List view will react to scroll and tapevents.
3. The app will use UITableView or UICollectionView.

## Deliverables:

The application will use the APIs provided at
https://docs.github.com/en/rest/activity/events?apiVersion=2022-11-28.

1. Choose 5 events to show from the 50 different events listed here
https://docs.github.com/en/developers/webhooks-and-events/events/github-event-types.
2. Display the Github events in a list.
3. The user’s avatar should be visible if present in the event.
4. Check for new events every 10 seconds and add them to the list.
5. Add a filtering mechanism to chose between the 5 event types.
6. When a list item is clicked, open a separate screen with some information about the
event.

## Bonus points:

Although not required, the following is a list of shiny features we would love to see:
* Unit tests.
* Multiple devices support.
* Dark mode support
* Async/Await or Combine
* SwiftUI

  
## Note:

We expect a zip file to be delivered with the following content:
* short README about what we should expect in the project and any note about what’s
left to be done.
* an Xcode project or workspace with everything needed to run the application, we expect to be able to unzip it, open it and run it with no modifications needed whatsoever.

## Follow up Discussion:
After completing the exercise please be ready for 45 minutes’ discussion on your key
decisions, assumptions and rationale for your implementation.
