//
//  SquareButtonStyle.swift
//  tic tac toe
//
//  Created by AlexGod on 08.04.2024.
//

import SwiftUI

struct SquareButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 50, height: 50)
            .foregroundColor(.black)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
            )
    }
}

struct SquareButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
        }
        .buttonStyle(SquareButtonStyle())
    }
}

#Preview {
    SquareButton(text: "", action: {})
}
