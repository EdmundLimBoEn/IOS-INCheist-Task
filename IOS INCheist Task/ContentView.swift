//
//  ContentView.swift
//  IOS INCheist Task
//
//  Created by Lim Bo En Edmund on 25/8/25.
// tesadlkjfhasdlkjfhlkjh
import SwiftUI

struct ContentView: View {
    @State private var showJoshuaSpeech = false
    @State private var showNextButton = false
    @State private var showIncoin = false
    @State private var showDecoded = false
    @State private var showKey = false
    @State private var userInput = ""
    @State private var unlockedArea = false
    
    private let secretKey = "INCIDENT"
    private let ciphertext = "APQWEIEM"
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack {
                    ZStack {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 120, height: 120)
                            .shadow(radius: 4)
                        
                        Image("kessler")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 110, height: 110)
                        
                        if !showKey {
                            VStack {
                                HStack {
                                    Button(action: { showKey = true }) {
                                        Circle()
                                            .fill(.thinMaterial)
                                            .frame(width: 28, height: 28)
                                            .overlay(Image(systemName: "key.fill").foregroundStyle(.primary))
                                    }
                                    Spacer()
                                }
                                Spacer()
                            }
                            .padding(6)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Button(action: {
                            withAnimation(.spring()) {
                                showJoshuaSpeech = true
                                showNextButton = true
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 120, height: 120)
                                    .shadow(radius: 4)
                                
                                Image("joshua")
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 110, height: 110)
                            }
                        }
                        if !showJoshuaSpeech {
                            Text("Click here").font(.footnote).foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(.horizontal, 40)
                
                if showJoshuaSpeech {
                    Text("Joshua: I didn’t do it!")
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 4)
                        .transition(.scale)
                }
                
                if showNextButton {
                    VStack(spacing: 4) {
                        Button("Next") {
                            withAnimation(.easeInOut) {
                                showIncoin = true
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        
                        if !showIncoin {
                            Text("Click here").font(.footnote).foregroundStyle(.secondary)
                        }
                    }
                }
                
                if showIncoin {
                    VStack(spacing: 4) {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                showDecoded = true
                            }
                        }) {
                            Circle()
                                .fill(.ultraThinMaterial)
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Text("₿")
                                        .font(.title.bold())
                                        .foregroundStyle(.primary)
                                )
                                .shadow(radius: 4)
                        }
                        if !showDecoded {
                            Text("Click here").font(.footnote).foregroundStyle(.secondary)
                        }
                    }
                    
                    if showDecoded {
                        VStack(spacing: 8) {
                            Text(ciphertext)
                                .font(.title2.monospaced())
                                .padding()
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                        }
                        .transition(.opacity)
                    }

                }
                
                if showKey {
                    Text("KEY = \(secretKey)")
                        .font(.callout.monospaced())
                        .padding()
                        .background(.thinMaterial, in: Capsule())
                        .shadow(radius: 3)
                        .padding(.top)
                }
                
                if showDecoded {
                    VStack(spacing: 12) {
                        Text("Kesler: Who was it?")
                            .padding()
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                        
                        TextField("Type here...", text: $userInput)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 40)
                        
                        VStack(spacing: 4) {
                            Button("Submit") {
                                let decoded = vigenereDecode(ciphertext: ciphertext, key: secretKey)
                                if userInput.uppercased() == decoded {
                                    withAnimation(.spring()) {
                                        unlockedArea = true
                                    }
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.green)
                            
                            if !unlockedArea {
                                Text("Click here").font(.footnote).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                
                if unlockedArea {
                    VStack(spacing: 14) {
                        Text("Scoobert discovered!")
                            .font(.title2.bold())
                            .padding()
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                        Text("He goes to the building: SST Rival Team Inc.")
                            .font(.callout)
                            .padding()
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
                        Text("Detective Kesler defeats Scoobert. The day is saved.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    .transition(.opacity)
                }
            }
            .padding()
        }
    }
    
    func vigenereDecode(ciphertext: String, key: String) -> String {
        let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let ctext = ciphertext.uppercased().map { $0 }
        let ktext = Array(key.uppercased())
        var result: [Character] = []
        
        for i in 0..<ctext.count {
            let c = ctext[i]
            if let cIndex = letters.firstIndex(of: c) {
                let kIndex = letters.firstIndex(of: ktext[i % ktext.count]) ?? 0
                let plainIndex = (cIndex - kIndex + 26) % 26
                result.append(letters[plainIndex])
            } else {
                result.append(c)
            }
        }
        return String(result)
    }
}



#Preview{
    ContentView()
}
