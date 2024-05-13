//
//  main.swift
//  Group4Tester
//
//  Created by (s) Adrian Chammas on 19/02/2024.
//
import Foundation

//definitions
let electric_times_spatial_difference_magnetic = cezh
let electric_times_previous_electric = ceze
let magnetic_times_previous_magnetic = chyh
let magnetic_times_spatial_difference_electric = chye

// Variables
let basename = "snapshot"
let hardwireSourceNode = 50
var frame = 0
let SIZE = 200
let LOSS_LAYER = 180
let LOSS = 0.02
var relativePermittivity = Array(repeating: 0.0, count: 200)
var Epsr: Double = 0.0
let impedance = 377.0
let PermittivityFreeSpace = 8.85e-12

let PermittivitySilicon = PermittivityFreeSpace * 11.7
let total_steps = 450
var materialData = ""

var electric_field = Array(repeating: 0.0, count: SIZE)
var magnetic_field = Array(repeating: 0.0, count: SIZE)
var ceze = Array(repeating: 0.0, count: SIZE)
var cezh = Array(repeating: 0.0, count: SIZE)
var chyh = Array(repeating: 0.0, count: SIZE)
var chye = Array(repeating: 0.0, count: SIZE)


for qtime in 0..<total_steps{
    
    for mm in 1..<SIZE{
        
         var Epsr = relativePermittivity[mm] = smoothTransitionDielectric(Double(total_steps), 40.0, 20.0, PermittivityFreeSpace, PermittivitySilicon)
        
    }
    
}



//Initialise electric field
InitialiseElectricField(Size: SIZE)

//Initialise magnetic field
InitialiseMagneticField(Size: SIZE)

//set electric field coefficients
SetElectricFieldCoefficient(Size: SIZE, LOSS_LAYER: LOSS_LAYER, impedance: impedance,
                            relativePermittivity: Epsr, LOSS: LOSS)

//set magnetic field coefficients
SetMagneticFieldCoefficient(Size: SIZE, LOSS_LAYER: LOSS_LAYER,
                            impedance: impedance, LOSS: LOSS)

let fileout = FileWriter(fileName: "Material.dat")
materialData = "Material: Loss " + String(LOSS) + " Relative Permittivity " + String(Epsr)
fileout.write_data(data: "")
fileout.append_data(data: materialData)

for dt in 0..<total_steps {
    
    
    
    
    
    
    
    
    let dt_subtract30 = Double(dt) - 30.0
    
    // Update magnetic field
    update_magnetic(ez: electric_field, hy: &magnetic_field, imp0: impedance, dt_subtract30: dt_subtract30)
    
    // Update electric field
    update_electric(ez: &electric_field, hy: magnetic_field, imp0: impedance, dt_subtract30: dt_subtract30)

    generateSnapshot(dt: dt)
}


 

 
 
