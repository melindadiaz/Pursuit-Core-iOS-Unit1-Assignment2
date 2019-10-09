//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = [
    "able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again"]
var secretWord = allTheWords.randomElement()!
var arrayWord = [String]()
var dashesHiddenWord: [Character] = []
var repeatCondition = true
var wrongAttempts = 6
var wrongTry = 0

print(secretWord)
print("Guess a letter")

for i in secretWord {
    dashesHiddenWord.append("_")
    arrayWord.append("\(i)")
}

func hanging() {
    if wrongTry == 1 {

    print("""
    _________
    |         |
    |         0
    |
    |
    |
    |
    """)
    }
        if wrongTry == 2 {
    print("""
     _________
     |         |
     |         0
     |         |
     |
     |
     |
     """)
    }
    if wrongTry == 3 {
    print("""
     _________
     |         |
     |         0
     |        /|
     |
     |
     |
     """)
    }
    if wrongTry == 4 {
    print("""
     _________
     |         |
     |         0
     |        /|\\
     |
     |
     |
     """)
    }
    if wrongTry == 5 {
    print("""
     _________
     |         |
     |         0
     |        /|\\
     |        /
     |
     |
     """)
    }
    if wrongTry == 6 {
    print("""
     _________
     |         |
     |         0
     |        /|\\
     |        / \\
     |
     |
     """)
    }
}


while wrongTry <= 7 {
    hanging()
    for char in dashesHiddenWord {
        print(char, terminator: " ")
    }
    print()
    let userInput = Character(readLine()?.lowercased() ?? "a") //
    if secretWord.contains(userInput) {
        for (index, char) in secretWord.enumerated() {
            if char == userInput {
                dashesHiddenWord[index] = char
            }
        }
        
        print("you typed \(userInput) great")
    } else {
        wrongTry += 1
        print("you typed \(userInput), attempt \(wrongTry) out of 6. Try Again")
        if wrongTry == wrongAttempts {
            repeatCondition = false
            break
        }
    }
}

print("""
 You're dead!
 _________
 |         |
 |         0
 |        /|\\
 |        / \\
 |
 |
 """)
// ~= is a short hand for contains, it ask if it contains in ARRAYS ONLY
//if secretWord ~= userImput {
//    print(" \(userImput) good guess")
//
//} else {
//    print("Try again")
//}


