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
            } label:
            {
                Text("I got you a friend, click here to meet him")
            }
            
        }
    }
}
#Preview {
    BeginView()
}
