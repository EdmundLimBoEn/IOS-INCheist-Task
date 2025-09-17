//
//  ContentView.swift
//  IOS INCheist Task
//
//  Created by Lim Bo En Edmund on 25/8/25.
// tesadlkjfhasdlkjfhlkjh
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("kesler")
                    .foregroundStyle(.tint)
                Text("big kessler")
                    .font(.largeTitle)
                NavigationLink {
                    BeginView()
                } label: {
                    if #available(iOS 26.0, *) {
                        Text("beninging")
                            .font(.headline)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .glassEffect(
                                .regular
                                    .tint(Color(hue: 0.76, saturation: 0.3, brightness: 0.9))
                                    .interactive(),
                                in: .capsule
                            )
                            .foregroundStyle(.white)
                    } else {
                        Text("beninging")
                            .font(.headline)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(
                                Capsule()
                                    .fill(Color(hue: 0.76, saturation: 0.3, brightness: 0.9).opacity(0.2))
                            )
                            .overlay(
                                Capsule()
                                    .stroke(Color(hue: 0.76, saturation: 0.3, brightness: 0.9), lineWidth: 1)
                            )
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding()
        }
        .tint(Color(hue: 0.76, saturation: 0.3, brightness: 0.9))
    }
}

#Preview {
    ContentView()
}
