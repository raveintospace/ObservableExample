//
//  SwiftfulNewWay.swift
//  ObservableMacroExample
//  https://youtu.be/hLkTMJ_SFzY?si=Q4YVbkv9wZpPn-8n
//  Created by Uri on 26/7/24.
//

import SwiftUI

@Observable
final class SwiftulNewWayViewModel {
    
    var title = "Some title"
}

struct SwiftulNewWay: View {
    
    @State private var viewModel = SwiftulNewWayViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Button(viewModel.title) {
                viewModel.title = "New Title"
            }
            
            SomeChildNewView(viewModel: viewModel)
            
            SomeThirdNewView()
        }
        .environment(viewModel)
    }
}

#Preview {
    SwiftulNewWay()
}

struct SomeChildNewView: View {
    
    @Bindable var viewModel: SwiftulNewWayViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "New Title from child view"
        }
    }
}

struct SomeThirdNewView: View {
    
    @Environment(SwiftulNewWayViewModel.self) var viewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "New title from third view"
        }
    }
}
