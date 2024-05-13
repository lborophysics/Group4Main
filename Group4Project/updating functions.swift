//
//  updating ez:hy.swift
//  Group4Project
//
//  Created by (s) Cate Georgescu on 06/03/2024.
//

import Foundation

func update_electric(ez: inout[Double], hy: [Double], imp0: Double, dt_subtract30: Double) {
    let SIZE = ez.count
    ez[0] = ez[1]
    ez[SIZE - 1] = ez[SIZE - 2]
    
    for mm in 1..<SIZE {
        let deltaHy = (hy[mm] - hy[mm - 1])
        ez[mm] = ceze[mm] * ez[mm] + cezh[mm] * deltaHy
    }
    ez[hardwireSourceNode] += exp(-(dt_subtract30) * (dt_subtract30) / 100.0)
}

func update_magnetic(ez: [Double], hy: inout[Double], imp0: Double, dt_subtract30: Double) {
    let SIZE = hy.count
    hy[SIZE - 1] = hy[SIZE - 2]
    for mm in 0..<(SIZE - 1) {
        hy[mm] = chyh[mm] * hy[mm] + chye[mm] * (ez[mm + 1] - ez[mm])
    }
    hy[hardwireSourceNode - 1] -= exp(-(dt_subtract30) * (dt_subtract30) / 100.0) / imp0
}

func update_polarizationCurrent(J: inout[Double], ez: [Double], E_temp: [Double]){
    let SIZE = J.count
    let g = 1.0     //change to real value
    let Sc = 1.0    //change to real value
    
    let Ng = 1/(g*dt)
    let Np = 5.0    //change between 5-10
    
    let cjj = (1 - 1/(2*Ng))/(1 + 1/(2*Ng))
    let cje = (1*2*pow(.pi,2)*Sc)/(1 + 1/(2*Ng)*pow(Np,2))
    
    for mm in 0..<SIZE {
        J[mm] = cjj * J[mm] + cje * (ez[mm] + E_temp[mm])
    }
}
