//
//  testAlgoritmo.swift
//  dVehiculos
//
//  Created by Alberto Fuentes on 08/01/2021.
//  Copyright © 2021 Juandi. All rights reserved.
//

import UIKit

class testAlgoritmo: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var num1 = 0, num2 = 0, num3 = 0 , num4 = 0, num5 = 0,
    num6 = 0, num7 = 0, num8 = 0 , num9 = 0, num10 = 0,
    num11 = 0, num12 = 0, num13 = 0 , num14 = 0, num15 = 0;
    //ALGORITMO AUTOMATICO
    
    
    // CLASE OPEL
    func claseOpel() -> Double{
        var resultado:Double = 0.0
        if (Double(num7) <= 41.0){
            resultado = 88.16 +
                Double(num1) * -0.07 +
                Double(num2) * -0 +
                Double(num3) * -0.05 +
                Double(num4) * 0.08 +
                Double(num5) * -0.45 +
                Double(num6) * 0.04 +
                Double(num7) * -0.01 +
                Double(num9) * -0 +
                Double(num10) * -0 +
                Double(num11) * 0.01 +
                Double(num12) * -0.39 +
                Double(num13) * 0.08 +
                Double(num14) * 0.36 +
                Double(num15) * -0.55 ;
        }
        else {
            resultado = 88.16 +
                90.24 +
                Double(num1) * -0.07 +
                Double(num2) * 0.53 +
                Double(num3) * 0.03 +
                Double(num4) * 0.11 +
                Double(num5) * -0.67 +
                Double(num6) * -0.47 +
                Double(num7) * 0.02 +
                Double(num9) * -0.27 +
                Double(num10) * -0.02 +
                Double(num11) * 0    +
                Double(num12) * -0.23 +
                Double(num13) * 0.02 +
                Double(num14) * -0.13 +
                Double(num15) * -0.01;
        }
        return resultado
    }
    
    // CLASE FURGONETA
    func claseFurgoneta() -> Double{
        var resultado:Double = 0.0
        if (Double(num7) <= 41.0){
            resultado = -191.3 +
                Double(num1) * 0.29 +
                Double(num2) * -0.5 +
                Double(num3) * 0.2  +
                Double(num4) * -0.06 +
                Double(num5) * 0.01 +
                Double(num6) * 0.14 +
                Double(num8) * -0.02 +
                Double(num7) * 0.21 +
                Double(num9) * 0.39 +
                Double(num10) * -0.02 +
                Double(num11) * -0.04 +
                Double(num12) * 0.1  +
                Double(num13) * -0.05 +
                Double(num14) * -0.01 +
                Double(num15) * 0.13;
        }
        else {
            resultado = -125.61 +
                Double(num1) * 0.33 +
                Double(num2) * -0.5 +
                Double(num3) * 0.24 +
                Double(num4) * -0.13 +
                Double(num5) * 0.07 +
                Double(num6) * 0.14 +
                Double(num8) * -0.06 +
                Double(num7) * 0.34 +
                Double(num9) * 0.49 +
                Double(num10) * -0.01 +
                Double(num11) * -0.04 +
                Double(num12) * 0.21 +
                Double(num13) * -0.06 +
                Double(num14) * -0.12 +
                Double(num15) * 0.3;
        }
        return resultado
    }
    
    // CLASE SAAB
    func claseSaab() -> Double{
        var resultado:Double = 0.0
        if (Double(num7) <= 41.0){
            resultado = 59.8 +
                Double(num1) * 0.18 +
                Double(num2) * -0.01 +
                Double(num3) * 0.07 +
                Double(num4) * 0.05 +
                Double(num5) * -0.31 +
                Double(num6) * -0.1 +
                Double(num7) * 0.16 +
                Double(num9) * -0.04 +
                Double(num10) * -0.01 +
                Double(num11) * -0.01 +
                Double(num12) * -0.14 +
                Double(num13) * -0.03 +
                Double(num14) * -0.82 +
                Double(num15) * 0.53;
        }
        else {
            resultado = 112.7 +
                Double(num1) * 0.12 +
                Double(num2) * -0.07 +
                Double(num3) * -0.04 +
                Double(num4) * 0.09 +
                Double(num5) * -0.61 +
                Double(num6) * -0.67 +
                Double(num7) * -0.08 +
                Double(num9) * -0.05 +
                Double(num11) * 0    +
                Double(num12) * -0.33 +
                Double(num13) * 0.04 +
                Double(num14) * -0.11 +
                Double(num15) * -0.2 ;
        }
        return resultado
    }
    
    // CLASE AUTOBUS
    func claseAutobus() -> Double{
        var resultado:Double = 0.0
        if (Double(num7) <= 41.0){
            resultado = -407.31 +
                Double(num1) * 0.59 +
                Double(num2) * 0.04 +
                Double(num3) * -0.04 +
                Double(num4) * -0.25 +
                Double(num5) * 0.67 +
                Double(num6) * -5.2 +
                Double(num7) * -0.65 +
                Double(num9) * -0.06 +
                Double(num10) * 0.05 +
                Double(num11) * 0.01 +
                Double(num12) * 1.74 +
                Double(num13) * 0.05 +
                Double(num14) * 1.72 +
                Double(num15) * -0.22;
        }
        else {
            resultado = -16.29 +
                Double(num1) * -0.06 +
                Double(num2) * 0.04 +
                Double(num3) * -0.08 +
                Double(num4) * -0.22 +
                Double(num5) * 0.37 +
                Double(num6) * -0.13 +
                Double(num8) * -0.11 +
                Double(num7) * -1.11 +
                Double(num9) * 0.14 +
                Double(num10) * 0.07 +
                Double(num12) * 0.12 +
                Double(num13) * 0.05 +
                Double(num14) * 0.56 +
                Double(num15) * -0.23;
        }
        return resultado
    }
    
    

}
