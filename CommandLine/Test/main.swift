//
//  main.swift
//  Group4Tester
//
//  Created by (s) Adrian Chammas on 19/02/2024.
//
import Foundation

// Variables
let basename = "snapshot"
let hardwireSourceNode = 50
var frame = 0
let SIZE = 200
let LOSS_LAYER = 180
let LOSS = 0.02
var ez = Array(repeating: 0.0, count: SIZE)
var hy = Array(repeating: 0.0, count: SIZE)
var ceze = Array(repeating: 0.0, count: SIZE)
var cezh = Array(repeating: 0.0, count: SIZE)
var chyh = Array(repeating: 0.0, count: SIZE)
var chye = Array(repeating: 0.0, count: SIZE)
let relativePermittivity = 9.0
let imp0 = 377.0
let maxTime = 450

//Initialise electric field
for mm in 0..<(SIZE){
    ez[mm] = 0.0
}

//Initialise magnetic field
for mm in 0..<(SIZE - 1){
    hy[mm] = 0.0
}

//set electric field coefficients
for mm in 0..<(SIZE){
    if(mm < 100){
        ceze[mm] = 1.0
        cezh[mm] = imp0
    }
    else if(mm < LOSS_LAYER){
        ceze[mm] = 1.0
        cezh[mm] = imp0 / relativePermittivity
    
    }
    else{
        ceze[mm] = (1.0 - LOSS) / (1.0 + LOSS)
        cezh[mm] = (imp0 / relativePermittivity) / (1.0 + LOSS)
    }
}

//set magnetic field coefficients
for mm in 0..<(SIZE){
    if(mm < LOSS_LAYER){
        chyh[mm] = 1.0
        chye[mm] = 1.0 / imp0
    }
    else{
        chyh[mm] = (1.0 - LOSS) / (1.0 + LOSS)
        chye[mm] = (1.0 / imp0) / (1.0 + LOSS)
    }
}

let fileout = FileWriter(fileName: "Electro.dat")
fileout.write_data(data: "")

for qTime in 0..<maxTime {
    let qTimeSubtract30 = Double(qTime) - 30.0
    
    // Update magnetic field
    update_magnetic(ez: ez, hy: &hy, imp0: imp0, qTimeSubtract30: qTimeSubtract30)
    
    // Update electric field
    update_electric(ez: &ez, hy: hy, imp0: imp0, qTimeSubtract30: qTimeSubtract30)

    generateSnapshot(qTime: qTime)

    fileout.append_data(data: "\(ez[50])\n")
}
