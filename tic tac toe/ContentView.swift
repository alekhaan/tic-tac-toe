//
//  ContentView.swift
//  tic tac toe
//
//  Created by AlexGod on 07.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isSinglePlayer = false
    @State private var isMultiPlayer = false
    
    var body: some View {
        VStack {
            Text("Крестики-нолики")
                .font(.title)
                .padding()

            Button(action: {
                isSinglePlayer = true
            }) {
                Image(systemName: "figure.stand")
                    .imageScale(.large)
                Text("Игра против компьютера")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                Image(systemName: "desktopcomputer")
                    .imageScale(.large)
            }
            .frame(width: 300)
            
            Button(action: {
                isMultiPlayer = true
            }) {
                Image(systemName: "figure.stand")
                    .imageScale(.large)
                Text("Игра на двоих")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                Image(systemName: "figure.stand")
                    .imageScale(.large)
            }
            .frame(width: 300)
        }
        .sheet(isPresented: $isSinglePlayer, content: {
            SinglePlayerGameView()
        })
        .sheet(isPresented: $isMultiPlayer, content: {
            MultiPlayerGameView()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
