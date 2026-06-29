//
//  RemoteImage.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 29/06/26.
//

import Foundation
import SwiftUI
import NukeUI

struct RemoteImage: View {
    let url: URL
    
    var body: some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if state.error != nil {
                    Text("Error loading image")
            } else {
                ProgressView()
            }
            
        }
    }
}
