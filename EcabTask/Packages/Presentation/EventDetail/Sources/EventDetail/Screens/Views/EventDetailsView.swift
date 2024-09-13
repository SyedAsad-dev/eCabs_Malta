//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import SwiftUI

public struct EventDetailsView: View {
    
    let viewModel: EventDetailsViewModel
    @State private var router: DetailsScreenRouterProtocol
    
    public init(
        viewModel: EventDetailsViewModel,
        router: DetailsScreenRouterProtocol
    ) {
        self.viewModel = viewModel
        _router = State(initialValue: router)
    }
    
    
    public var body: some View {
        GeometryReader(content: { geometry in
            VStack(alignment: .leading) {
                EventImageView(
                    size: geometry.size,
                    image: URL(string: viewModel.event.actor?.avatarURL ?? "")
                )
                
                EventInfoView(
                    event: viewModel.event
                )
            }
        })
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    router.goBack()
                }, label: {
                    ZStack{
                        Circle()
                            .frame(width: 40)
                            .foregroundStyle(.white)
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 20, height: 15)
                            .foregroundStyle(.black)
                    }
                })
            }
        }
    }
}

