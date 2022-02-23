//
// EinsteinEquation.swift
//
// Created by Ina Tolo
// Created on 2022-2-22
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The EinsteinEquation program implements an application that
// calculates the amount of energy released from an object.

import Foundation

// stores excpetion at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that throws exception
func catchString() throws {
    throw MyError.runtimeError("Invalid entry!")
}

// declaring constant
let speedOfLight = 2.998 * pow(10.0, 8.0)
let joulesInKilo = 2.390057361 * pow(10.0, -13)

// displays opening message
print("Today I will tell you the amount of energy released from an object.")
print("")

// gets input from user
print("Enter the mass of an object (kg): ")
let massString = readLine()

// blank line
print()

do {
    // converting input to double
    let massDouble = Double(massString!) ?? 0
    // checks for negative values
    if massDouble > 0 {
        let energy = massDouble * (pow(speedOfLight, 2))
        let kiloton = energy * joulesInKilo
        print("\(massDouble)kg of mass would produce \(energy)J of energy.")
        print("Rougly \(kiloton) kiloton bombs are equal to this amount of energy in Joules.")
    } else if massDouble < 0 {
        print("Objects must have a mass greater than 0.")
    } else {
        try catchString()
    }
} catch MyError.runtimeError(let errorMessage) {
    // catches invalid strings
    print(errorMessage)
}
