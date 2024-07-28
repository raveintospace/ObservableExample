//
//  ContentView.swift
//  ObservableMacroExample
//  https://youtu.be/c-gCXq_1EJU?si=fIrrLNhFo8_XqpC5
// https://medium.com/@vladislavshkodich/remove-observableobject-from-your-swiftui-model-cb455e9572ef
//  Created by Uri on 21/10/23.
//

import SwiftUI
import Observation

// we don't need @Published for our properties
// we don't set viewmodel: ObservableObject

@Observable
final class ViewModel {
    init() {}
    
    var name = "@Observable example"
    var likes = 46
}

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            Text(viewModel.name)
                .fontWeight(.semibold)
                .padding()
            Text("\(viewModel.likes) likes")
                .font(.system(size: 32, weight: .semibold))
                .foregroundColor(.yellow)
            
            Button {
                viewModel.likes += 1
            } label: {
                Text("Add a like 👍🏻")
                    .font(.system(size: 28, weight: .semibold))
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
