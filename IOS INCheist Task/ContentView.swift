//
//  ContentView.swift
//  IOS INCheist Task
//
//  Created by Lim Bo En Edmund on 25/8/25.
// test 4
import SwiftPersistence
import SwiftUI

struct ContentView: View {
    @State var button_nonpersist = false
    var body: some View {
        VStack {
            Image("kesler")
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
