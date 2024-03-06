//
//  NewMain.swift
//  Group4Project
//
//  Created by (s) Freddie Roberts on 28/02/2024.
//

import Foundation

func update_electric(ez: inout[Double], hy: [Double], imp0: Double) {
    let SIZE = ez.count
    
    for mm in 1..<SIZE {
        ez[mm] += (hy[mm] - hy[mm - 1]) * imp0
    }
}

func update_magnetic(ez: [Double], hy: inout[Double], imp0: Double) {
    let SIZE = hy.count
    
    for mm in 0..<(SIZE - 1) {
        hy[mm] += (ez[mm + 1] - ez[mm]) / imp0
    }
}
