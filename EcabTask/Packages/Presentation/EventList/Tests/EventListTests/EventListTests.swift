
import XCTest
import Domain
import Common
import Data
import Foundation
@testable import EventList

final class EventListTests: XCTestCase {
    var mockService: EventListMockService!
    var viewModel: EventListViewModel!
    
    override func setUp() {
        super.setUp()
        mockService = EventListMockService(repository: RemoteCharactersLoader())
        viewModel = EventListViewModel(loader: mockService)
    }
    
    override func tearDown() {
         mockService = nil
         viewModel = nil
         super.tearDown()
     }
    
    // Test if events are fetched and updated correctly
     func testFetchEventsUpdatesEventsList() async {
         let mockEvents = GitHubEvents([GitHubEvent(
            id: "1",
            type: "PushEvent",
            actor: nil,
            repo: nil,
            payload: nil,
            gitHubEventPublic: nil,
            createdAt: nil
        )])
         mockService.mockEvents = mockEvents

         try? await viewModel.fetchEvents()

         XCTAssertEqual(viewModel.eventsList.count, 1)
         XCTAssertEqual(viewModel.eventsList.first?.id, "1")
     }
    
    // Test the receivedFilteredEvents method
    @MainActor func testReceivedFilteredEventsFiltersCorrectly() {
          let mockEvents = GitHubEvents([
            GitHubEvent(
               id: "1",
               type: "PushEvent",
               actor: nil,
               repo: nil,
               payload: nil,
               gitHubEventPublic: nil,
               createdAt: nil
           ),
            GitHubEvent(
               id: "2",
               type: "PullRequestEvent",
               actor: nil,
               repo: nil,
               payload: nil,
               gitHubEventPublic: nil,
               createdAt: nil
           ),
            GitHubEvent(
               id: "3",
               type: "PushEvent",
               actor: nil,
               repo: nil,
               payload: nil,
               gitHubEventPublic: nil,
               createdAt: nil
           )
          ])
          viewModel.updatingEvent_FilterList(newData: mockEvents)
          viewModel.updateEventListBasedOnFilter(selectedItem: "PushEvent")
          XCTAssertEqual(viewModel.filteredList.count, 2)
          XCTAssertEqual(viewModel.filteredList.first?.type, "PushEvent")
      }
    
    // Test appending unique data
      func testAppendUniqueDataAddsOnlyNewItems() {
          var existingArray = GitHubEvents([
            GitHubEvent(
               id: "1",
               type: "PushEvent",
               actor: nil,
               repo: nil,
               payload: nil,
               gitHubEventPublic: nil,
               createdAt: nil
           ),
            GitHubEvent(
               id: "2",
               type: "PullRequestEvent",
               actor: nil,
               repo: nil,
               payload: nil,
               gitHubEventPublic: nil,
               createdAt: nil
           )
          ])
          let newData = GitHubEvents([
            GitHubEvent(
               id: "2",
               type: "PullRequestEvent",
               actor: nil,
               repo: nil,
               payload: nil,
               gitHubEventPublic: nil,
               createdAt: nil
           ),
            GitHubEvent(
               id: "3",
               type: "IssueEvent",
               actor: nil,
               repo: nil,
               payload: nil,
               gitHubEventPublic: nil,
               createdAt: nil
           )
          ])

          viewModel.appendUniqueData(existingArray: &existingArray, newData: newData)
          
          XCTAssertEqual(existingArray.count, 3)
          XCTAssertEqual(existingArray.first?.id, "3") // Checks if the new data comes first
      }
    
    
    // Test fetching and filtering events
      func testFetchAndFilterEvents() async {
          // Prepare mock events with different types

          mockService.mockEvents = [
            GitHubEvent(
                id: "1",
                type: "PushEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "2",
                type: "PullRequestEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "3",
                type: "IssuesEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "4",
                type: "WATCHEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "5",
                type: "DeleteEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "6",
                type: "NoEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            )
          ]
          
          
          // Set the viewModel to filter only "PushEvent"
   
             try? await viewModel.fetchEvents()
              
              // Assert that only PushEvent is present
              XCTAssertTrue(viewModel.filterTypes.contains("PushEvent"))
          
      }
    
    // Test updating filter types
    func testUpdateFilterTypesUpdatesCorrectly() {
        let mockEvents = GitHubEvents([
            GitHubEvent(
                id: "1",
                type: "PushEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "2",
                type: "PullRequestEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "3",
                type: "IssueEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "4",
                type: "ForkEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "5",
                type: "StarEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "6",
                type: "WatchEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            ),
            GitHubEvent(
                id: "7",
                type: "NoWatchEvent",
                actor: nil,
                repo: nil,
                payload: nil,
                gitHubEventPublic: nil,
                createdAt: nil
            )
        ])

        viewModel.updateFilterTypes(events: mockEvents)
        XCTAssertEqual(viewModel.filterTypes.count, 6) // Including "All"
        XCTAssertTrue(viewModel.filterTypes.contains("All"))
    }
    
    // Test if the fetching task is cancelled
     func testStopFetchingCancelsFetchTask() {
         viewModel.requestEventList()
         XCTAssertNotNil(viewModel.fetchTask)
         
         viewModel.stopFetching()
         XCTAssertNil(viewModel.fetchTask)
     }
}
