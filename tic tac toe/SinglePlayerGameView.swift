//
//  GameView.swift
//  tic tac toe
//
//  Created by AlexGod on 07.04.2024.
//

import SwiftUI

struct SinglePlayerGameView: View {
    @State private var board = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @State private var currentPlayer = "❌"
    @State private var winner = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
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
                                    if currentPlayer == "⭕️" && winner.isEmpty {
                                        performComputerMove()
                                    }
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
            Alert(title: Text(winner == "Ничья" ? "Ничья!" : "Победа!"), message: winner == "Ничья" ? Text("Компьютер хочет еще!"): Text(winner == "❌" ? "Вы выиграли!" : "Выиграл компьюетер!"), dismissButton: .default(Text("Ок"), action: {
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

    func performComputerMove() {
        var emptyCells = [(Int, Int)]()
        for i in 0..<3 {
            for j in 0..<3 {
                if board[i][j] == "" {
                    emptyCells.append((i, j))
                }
            }
        }
        let opponentSymbol = currentPlayer == "❌" ? "⭕️" : "❌"
        var bestMove: (Int, Int)? = nil
        for (row, col) in emptyCells {
            board[row][col] = currentPlayer
            if checkWinner() == currentPlayer {
                bestMove = (row, col)
            }
            board[row][col] = ""
            board[row][col] = opponentSymbol
            if checkWinner() == opponentSymbol {
                bestMove = (row, col)
            }
            board[row][col] = ""
        }
        if bestMove == nil {
            bestMove = emptyCells.randomElement()
        }
        if let move = bestMove {
            board[move.0][move.1] = currentPlayer
        }
        currentPlayer = opponentSymbol
        if let result = checkWinner() {
            winner = result
        }
    }
}

#Preview {
    SinglePlayerGameView()
}
