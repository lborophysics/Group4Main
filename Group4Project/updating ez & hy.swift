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
        //        func update_refractive_index(n0: inout [Double], n2: Double, ez: [Double]){
        //            let SIZE = n0.count
        //            for mm in 0..<SIZE {
        //                n0[mm] += n2 * pow(abs(ez[mm]),2)
        //            }
        //        }
        
        
        
        //        let deltaHy = (hy[mm] - hy[mm - 1])
        //        ez[mm] = ceze[mm] * ez[mm] + cezh[mm] * deltaHy
        //    }
        
        
        ez[mm] = ez[mm] + (hy[mm] - hy[mm - 1]) * imp0 / Epsr
        
        ez[hardwireSourceNode] += exp(-(dt_subtract30) * (dt_subtract30) / 100.0)
        
    }
}

func update_magnetic(ez: [Double], hy: inout[Double], imp0: Double, dt_subtract30: Double) {
    let SIZE = hy.count
    hy[SIZE - 1] = hy[SIZE - 2]
    for mm in 0..<(SIZE - 1) {
        hy[mm] = hy[mm] + (ez[mm + 1] - ez[mm]) / imp0;
    }
    hy[hardwireSourceNode - 1] -= exp(-(dt_subtract30) * (dt_subtract30) / 100.0) / imp0
}
