//
//  updating ez:hy.swift
//  Group4Project
//
//  Created by (s) Cate Georgescu on 06/03/2024.
//

import Foundation

func update_electric(ez: inout[Double], hy: [Double], imp0: Double, qTimeSubtract30: Double) {
    let SIZE = ez.count
    for mm in 1..<SIZE {
        ez[mm] += (hy[mm] - hy[mm - 1]) * imp0
    }
    ez[hardwireSourceNode] += exp(-(qTimeSubtract30) * (qTimeSubtract30) / 100.0)
}

func update_magnetic(ez: [Double], hy: inout[Double], imp0: Double, qTimeSubtract30: Double) {
    let SIZE = hy.count
    hy[SIZE - 1] = hy[SIZE - 2]
    for mm in 0..<(SIZE - 1) {
        hy[mm] += (ez[mm + 1] - ez[mm]) / imp0
    }
    hy[hardwireSourceNode - 1] -= exp(-(qTimeSubtract30) * (qTimeSubtract30) / 100.0) / imp0
}
