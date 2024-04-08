//
//  MultiPlayerGameView.swift
//  tic tac toe
//
//  Created by AlexGod on 07.04.2024.
//

import SwiftUI

struct MultiPlayerGameView: View {
    @State private var board = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @State private var currentPlayer = "❌"
    @State private var winner = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("Ходит играющий за \(currentPlayer == "❌" ? "крестики" : "нолики")")
                .font(.title3)
                .padding()
            ForEach(0..<3) { row in
                HStack(spacing: 10) {
                    Spacer()
                    ForEach(0..<3) { col in
                        SquareButton(text: board[row][col], action: {
                            if board[row][col] == "" && winner.isEmpty {
                                board[row][col] = currentPlayer
                                if let result = checkWinner() {
                                    winner = result
                                } else {
                                    currentPlayer = currentPlayer == "❌" ? "⭕️" : "❌"
                                }
                            }
                        })
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity)
        .alert(isPresented: .constant(!winner.isEmpty)) {
            Alert(title: Text(winner == "Ничья" ? "Ничья!" : "Победа!"), message: winner == "Ничья" ? Text("Еще разок?"): Text("Выиграли \(winner == "❌" ? "крестики" : "нолики")"), dismissButton: .default(Text("Ок"), action: {
                presentationMode.wrappedValue.dismiss()
            }))
        }
    }

    func checkWinner() -> String? {
        for i in 0..<3 {
            if board[i][0] != "" && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
                return board[i][0]
            }
            if board[0][i] != "" && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
                return board[0][i]
            }
        }
        if board[0][0] != "" && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
            return board[0][0]
        }
        if board[0][2] != "" && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
            return board[0][2]
        }
        if !board.joined().contains("") {
            return "Ничья"
        }
        return nil
    }
}

#Preview {
    MultiPlayerGameView()
}
