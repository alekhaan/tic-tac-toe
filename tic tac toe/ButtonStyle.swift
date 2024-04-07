//
//  ButtonStyle.swift
//  tic tac toe
//
//  Created by AlexGod on 07.04.2024.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
            Spacer()
        }
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .font(.system(.title2, design: .rounded).bold())
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .foregroundColor(.yellow)
        .background {
            Capsule()
                .stroke(.yellow, lineWidth: 2)
        }
    }
}
