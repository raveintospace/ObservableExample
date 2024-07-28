//
//  SwiftulExample.swift
//  ObservableMacroExample
//  https://youtu.be/hLkTMJ_SFzY?si=Q4YVbkv9wZpPn-8n
//  Created by Uri on 26/7/24.
//

import SwiftUI

final class SwiftfulOldWayViewModel: ObservableObject {
    
    @Published var title = "Some title"
}

struct SwiftfulOldWay: View {
    
    @StateObject private var viewModel = SwiftfulOldWayViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Button(viewModel.title) {
                viewModel.title = "New Title"
            }
            
            SomeChildView(viewModel: viewModel)
            
            SomeThirdView()
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    SwiftfulOldWay()
}

struct SomeChildView: View {
    
    @ObservedObject var viewModel: SwiftfulOldWayViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "New Title from child view"
        }
    }
}

struct SomeThirdView: View {
    
    @EnvironmentObject var viewModel: SwiftfulOldWayViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "New title from third view"
        }
    }
}
