//
//  IntroduceCornerKesslerView.swift
//  IOS INCheist Task
//
//  Created by Lim Bo En Edmund on 1/9/25.
//
import SwiftUI

struct IntroduceCornerKesslerView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Background (pushes ZStack to full screen)
            Color.clear
                .edgesIgnoringSafeArea(.all)

            // Your text content (centered)
            VStack {
                Text("This is corner kessler, he is here to help you")
                    .font(.largeTitle)
                Text("jk hes purely cosmetic cuz we dont know how to code")
                    .font(.system(size: 12))
                Text("he is different from other kesslers, he is in the corner")
                    .font(.title)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.clear)

            // Your image in the bottom right corner
            Image("kesler")
                .resizable()
                .frame(width: 180, height: 100)
                .padding(.trailing, -20) // Right padding
                .padding(.bottom, -10)  // Bottom padding
        }
    }
}

#Preview {
    IntroduceCornerKesslerView()
}

