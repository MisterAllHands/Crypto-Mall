//
//  Stars.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-01.
//

import SwiftUI

struct Stars: View {
    var body: some View {
        ZStack {
            ZStack {
                Star()
                Star().offset(x: -90, y: -80)
                Star().offset(x: -300, y: -20)
                Star().offset(x: -200, y: 140)
            }
            ZStack {
                Star2()
                Star2().offset(x: 50, y: 110)
                Star2().offset(x: 150, y: -110)
                Star2().offset(x: 220, y: -50)
                Star2().offset(x: 200, y: 70)
                Star2().offset(x: 176, y: 100)
                Star2().offset(x: 100, y: 20)
                Star2().offset(x: 140, y: -20)
                Star2().offset(x: 180, y: -70)
            }
            
            ZStack {
                Star2()
                Star2().offset(x: 50, y: 110)
                Star2().offset(x: 150, y: -110)
                Star2().offset(x: 220, y: -50)
                Star2().offset(x: 200, y: 70)
                Star2().offset(x: 176, y: 100)
                Star2().offset(x: 100, y: 20)
                Star2().offset(x: 140, y: -20)
                Star2().offset(x: 180, y: -70)
            }
            .offset(x: -200, y: -50)
            
            ZStack {
                Star2()
                Star2().offset(x: 50, y: 110)
                Star2().offset(x: 150, y: -110)
                Star2().offset(x: 220, y: -50)
                Star2().offset(x: 200, y: 70)
                Star2().offset(x: 176, y: 100)
                Star2().offset(x: 100, y: 20)
                Star2().offset(x: 140, y: -20)
                Star2().offset(x: 180, y: -70)
            }
            .offset(x: -220, y: 150)
            
            ZStack {
                Star3()
                Star3().offset(x: 60, y: 10)
                Star3().offset(x: 30, y: 90)
                Star3().offset(x: 90, y: 140)
                Star3().offset(x: -20, y: 100)
                Star3().offset(x: -80, y: 180)
                Star3().offset(x: -40, y: 120)
                Star3().offset(x: -20, y: -20)
                Star3().offset(x: 100, y: 70)
                Star3().offset(x: 130, y: 120)
            }
        }
    }
}

struct Stars_Previews: PreviewProvider {
    static var previews: some View {
        Stars()
    }
}
