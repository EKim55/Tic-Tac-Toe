//
//  TicTacToeGame.swift
//  Tic-Tac-Toe
//
//  Created by CSSE Department on 3/19/18.
//  Copyright © 2018 CSSE Department. All rights reserved.
//

import Foundation

class TicTacToeGame: CustomStringConvertible {
    enum GameState: String {
        case xTurn = "X's Turn"
        case oTurn = "O's Turn"
        case xWin = "X Wins!"
        case oWin = "O Wins!"
        case tieGame = "Tie Game"
    }
    
    enum MarkType: String {
        case x = "X"
        case o = "O"
        case none = "_"
    }
    
    var gameState: GameState
    var gameBoard = [MarkType]()
    
    init() {
        gameState = .xTurn
        gameBoard = [MarkType](repeating: .none, count: 9)
    }
    
    func pressedSquare(_ index: Int) {
        if gameBoard[index] != .none {
            return
        }
        if gameState == .xTurn {
            gameBoard[index] = .x
            gameState = .oTurn
            checkForGameOver()
        } else if gameState == .oTurn {
            gameBoard[index] = .o
            gameState = .xTurn
            checkForGameOver()
        }
    }
    
    func checkForGameOver() {
        if !gameBoard.contains(.none) {
            gameState = .tieGame
        }
        var linesOf3 = [String]()
        linesOf3.append(getGameString([0, 1, 2]))
        linesOf3.append(getGameString([3, 4, 5]))
        linesOf3.append(getGameString([6, 7, 8]))
        linesOf3.append(getGameString([0, 3, 6]))
        linesOf3.append(getGameString([1, 4, 7]))
        linesOf3.append(getGameString([2, 5, 8]))
        linesOf3.append(getGameString([0, 4, 8]))
        linesOf3.append(getGameString([2, 4, 6]))
        for lineOf3 in linesOf3 {
            if lineOf3 == "XXX" {
                gameState = .xWin
                return
            } else if lineOf3 == "OOO" {
                gameState = .oWin
                return
            }
        }
    }
    
    func getGameString(_ indices: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]) -> String{
        var gameString = ""
        for index in indices {
            gameString += gameBoard[index].rawValue
        }
        return gameString
    }
    
    var description: String {
        return "\(gameState.rawValue) Board: \(getGameString())"
    }
}
