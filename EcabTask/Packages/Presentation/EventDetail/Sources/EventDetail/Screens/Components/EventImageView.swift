//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import SwiftUI
import Kingfisher

struct EventImageView: View {
    let size: CGSize
    let image: URL?
    var body: some View {
        KFImage(image)
            .resizable()
            .scaledToFill()
            .frame(width: size.width, height: size.height * 0.4)
            .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
    }
}
