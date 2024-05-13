//
//  SetMagneticElectricCoefficients.swift
//  Group4Project
//
//  Created by (s) Freddie Roberts on 24/04/2024.
//

import Foundation

func InitialiseElectricField(Size: Int){
    for mm in 0..<(SIZE){
        electric_field[mm] = 0.0
    }
}

func InitialiseMagneticField(Size: Int){
    for mm in 0..<(SIZE - 1){
        magnetic_field[mm] = 0.0
    }
}

func InitialisePolarizationCurrent(Size: Int){
    for mm in 0..<(SIZE - 1){
        polarizationCurrent[mm] = 0.0
    }
}

func SetElectricFieldCoefficient(Size:Int, LOSS_LAYER:Int, impedance:Double,
                                        relativePermittivity:Double, LOSS:Double){
    for mm in 0..<(SIZE){
        if(mm < 100){
            ceze[mm] = 1.0
            cezh[mm] = impedance
        }
        else if(mm < LOSS_LAYER){
            ceze[mm] = 1.0
            cezh[mm] = impedance / relativePermittivity
        
        }
        else{
            ceze[mm] = (1.0 - LOSS) / (1.0 + LOSS)
            cezh[mm] = (impedance / relativePermittivity) / (1.0 + LOSS)
        }
    }
}

func SetMagneticFieldCoefficient(Size:Int, LOSS_LAYER:Int, impedance:Double, LOSS:Double){
    for mm in 0..<(SIZE){
        if(mm < LOSS_LAYER){
            chyh[mm] = 1.0
            chye[mm] = 1.0 / impedance
        }
        else{
            chyh[mm] = (1.0 - LOSS) / (1.0 + LOSS)
            chye[mm] = (1.0 / impedance) / (1.0 + LOSS)
        }
    }
}
