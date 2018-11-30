//
//  main.swift
//  RandomNumber
//
//  Created by Thomas Dato on 11/29/18.
//  Copyright © 2018 Tommy Dato. All rights reserved.
//

import Foundation

var randomNumber = 1
var continueGuessing = true
var keepPlaying = true
var input = ""
var numGuesses = 0
var numPlays = 1

while keepPlaying
{
    randomNumber = Int(arc4random_uniform(101)) // get a random number between 0 and 100
    // uncomment to display the correct number for testing purposes
    //print("The random number to guess is: \(randomNumber)")
    
    while continueGuessing
    {
        print("Pick a number between 0 and 100.")
        
        input = NSString(data: FileHandle.standardInput.availableData, encoding:String.Encoding.utf8.rawValue)! as String // Get Keyboard input
        input = input.replacingOccurrences(of: "\n", with: "", options: NSString.CompareOptions.literal, range:nil) // strips off the \n
        
        if let userGuess = Int(input)
        {
            if userGuess == randomNumber
            {
                // input correct
                continueGuessing = false
                print("That's the correct number!")
            }
            else if userGuess > randomNumber
            {
                // input too high
                print("Your guess is too high!")
                numGuesses += 1
            }
            else
            {
                // input too low
                print("Your guess is too low!")
                numGuesses += 1
            }
            
            print("You have guessed \(numGuesses) time(s)")
        }
        else
        {
            // invalid input
            print("Invalid guess, please try again.")
        }
    }
    
    // get input for keepPlaying
    print("Would you like to play again? Y or N")
    input = NSString(data: FileHandle.standardInput.availableData, encoding:String.Encoding.utf8.rawValue)! as String
    input = input.replacingOccurrences(of: "\n", with: "", options: NSString.CompareOptions.literal, range: nil)
    
    if input == "N" || input == "n"
    {
        keepPlaying = false
        print("You have played \(numPlays) time(s)")
    }
    else
    {
        numPlays += 1
    }
    numGuesses = 0
    continueGuessing = true
}

