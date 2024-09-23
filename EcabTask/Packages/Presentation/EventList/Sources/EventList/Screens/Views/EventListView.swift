//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import SwiftUI

public struct EventListView: View {
    @State var viewModel: EventListViewModel
    @State private var router: ListScreenRouterProtocol
    public init(
        viewModel: EventListViewModel,
        router: ListScreenRouterProtocol
    ) {
        self.viewModel = viewModel
        _router = State(initialValue: router)
    }
    public var body: some View {
            GeometryReader { geometry in
                VStack(spacing: 20){
                    FilterCollectionView(
                        viewModel: viewModel,
                        frame: CGRect(
                            x: 0,
                            y: 0,
                            width: geometry.size.width,
                            height: 40
                        )
                    )
                    .frame(width: geometry.size.width, height: 40)
                    EventsTableView(
                        viewModel: viewModel,
                        frame: CGRect(
                            x: 0,
                            y: 0,
                            width: geometry.size.width,
                            height: geometry.size.height
                        )
                    ) { selectedEvent in
                        router.openDetails(event: selectedEvent)
                    }
                }
            }
        .padding(.horizontal)
        .LoadingConfig(show: $viewModel.isLoading)
        .onViewDidLoad {
            viewModel.requestEventList()
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
               title: Text(viewModel.presentableError),
               primaryButton: .default(Text("Retry")) {
                   viewModel.requestEventList()
               },
               secondaryButton: .cancel {}
           )
        }
        .navigationTitle("Events")
        .navigationBarTitleDisplayMode(.inline)
    }
}

