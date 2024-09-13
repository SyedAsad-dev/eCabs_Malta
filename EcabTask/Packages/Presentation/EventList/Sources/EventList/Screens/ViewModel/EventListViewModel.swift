//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import Common
import Domain

public final class EventListViewModel: BaseViewModel {
    private(set) var selectedEventType: String = "All"
    @Published private(set) var eventsList: GitHubEvents = GitHubEvents()
    @Published private(set) var filteredList: GitHubEvents = GitHubEvents()
    @Published var filterTypes: [String] = ["All"] // Starts with "All" as the default option
    var fetchTask: Task<Void, Never>?
    let loader: EventListUseCaseProtocol
    public init(
        loader: EventListUseCaseProtocol
    ) {
        self.loader = loader
    }
}



// MARK: - EventBusinessLogic
extension EventListViewModel {
    
    @MainActor
    func updateEventListBasedOnFilter(selectedItem: String) {
            selectedEventType = selectedItem
           if selectedEventType == "All" {
               self.filteredList = self.eventsList
           } else {
               self.filteredList = self.eventsList.filter { $0.type == selectedEventType }
           }
        self.filterTypes = filterTypes
       }
    

    func requestEventList() {
        fetchTask?.cancel()
        fetchTask = Task {
            do {
                try await fetchEvents()
                // Hit the API every 10 second
                while !Task.isCancelled {
                    do {
                        // Wait for 10 seconds before the next API call
                        try await Task.sleep(nanoseconds: 10 * 1_000_000_000) // 10 seconds delay
                        try await fetchEvents()
                        
                    } catch {
                        stopFetching()
                    }
                }
            }  catch {
                stopFetching()
            }
        }
    }
    
    // Function to stop fetching events
    func stopFetching() {
        fetchTask?.cancel() // Cancel the running task
        fetchTask = nil     // Clear the reference to the task
    }

    
     func fetchEvents() async throws  {
        dataStatus = .success(.loading)
        do {
            let info = try await loader.execute()
            await updatingEvent_FilterList(newData: info)
            dataStatus = .success(.finished(.success))
        } catch {
            dataStatus = .failure(.invalidData(error.localizedDescription, "error"))
            throw error
        }
    }
    
    @MainActor  func updatingEvent_FilterList(newData: GitHubEvents) {
        if (self.filterTypes.count > 1) {
            appendUniqueData(existingArray: &self.eventsList, newData: newData)
        } else {
            self.eventsList.append(contentsOf: newData)
        }
        updateFilterList_5_types()
        updateEventListBasedOnFilter(selectedItem: selectedEventType)
    }
    
     func updateFilterList_5_types() {
        if filterTypes.count < 6 {
            updateFilterTypes(events: self.eventsList)
        }
    }
    
    
    // Function to append unique data from newData to existingArray
    func appendUniqueData(existingArray: inout GitHubEvents, newData: GitHubEvents) {
        // Create a set of existing IDs for quick lookup
        let existingIDs = Set(existingArray.map { $0.id })
        
        // Filter newData to remove duplicates that already exist in existingArray
        let uniqueNewData = newData.filter { !existingIDs.contains($0.id) }
        
        // Prepend uniqueNewData to existingArray
        existingArray.insert(contentsOf: uniqueNewData, at: 0)
    }
    
    // Function to update filter types dynamically
       func updateFilterTypes(events: [GitHubEvent]) {
          self.filterTypes = ["All"] + getTop5UniqueEventTypes(events: events) // Add "All" as the first option
      }
    
    // Function to find the top 5 unique event types based on frequency
    func getTop5UniqueEventTypes(events: [GitHubEvent]) -> [String] {
        
        let uniqueTypes = Set(events.compactMap { $0.type })
        
        // Step 2: Get the first five unique types
        let top5Types = Array(uniqueTypes.prefix(5))
        
        return top5Types
        
    }
}

