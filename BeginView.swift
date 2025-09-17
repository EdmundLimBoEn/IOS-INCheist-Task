//
//  BeginView.swift
//  IOS INCheist Task
//
//  Created by Lim Bo En Edmund on 1/9/25.
//

import SwiftUI

struct BeginView: View {
    var body: some View {
        NavigationStack {
            Text("welcome to INCheist investigation")
            NavigationLink{
                IntroduceCornerKesslerView()
            } label: {
                if #available(iOS 26.0, *) {
                    Text("I got you a friend, click here to meet him")
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
                    Text("I got you a friend, click here to meet him")
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
    }
}
#Preview {
    BeginView()
}
