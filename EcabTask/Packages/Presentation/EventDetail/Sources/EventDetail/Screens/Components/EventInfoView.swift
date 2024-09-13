//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import SwiftUI
import Domain

struct EventInfoView: View {
    
    let event: GitHubEvent
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center){
                Text("Date: ")
                    .fontWeight(.bold)
                    .font(.caption2)
                Text(event.createdAt ?? "")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }.padding()
            HStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 0) {
                   
                    HStack {
                        Text(event.actor?.displayLogin ?? "")
                          
                        Circle()
                           
                            .frame(width: 5)
                        Text(event.repo?.name ?? "")
                            .foregroundStyle(.gray)
                    }
                }
                
            }
            .padding()
            Text(event.id ?? "")
                .font(.title2)
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background {
                    Capsule()
                        .fill(.blue.opacity(0.5))
                }
            HStack(alignment: .top){
                Text("Repo Name :")
                    .fontWeight(.bold)
                    .font(.title2)
                Text(event.repo?.name ?? "")
              
                    .font(.title2)
            }
            .padding(.horizontal)
        }
    }
}
