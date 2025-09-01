//
//  ContentView.swift
//  IOS INCheist Task
//
//  Created by Lim Bo En Edmund on 25/8/25.
// tesadlkjfhasdlkjfhlkjh
import SwiftPersistence
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image("kesler")
                    .foregroundStyle(.tint)
                Text("big kessler")
                    .font(.largeTitle)
                NavigationLink{
                    BeginView()
                } label: {
                    Text("beninging")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
