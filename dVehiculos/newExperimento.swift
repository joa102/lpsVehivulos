//
//  newExperimento.swift
//  dVehiculos
//
//  Created by Alberto Fuentes on 25/11/20.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit

class newExperimento: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //Conexiones
    @IBOutlet weak var numeros: UIPickerView!

    @IBOutlet weak var var1: UILabel!
    //Variables
    var valornumeros:[[String]] = [[String]]()
    var v1 :String = "0"
    var v2 :String = "0"
    var v3 :String = "0"
    
    //Constructor inicial
    override func viewDidLoad() {
        super.viewDidLoad()
        selectorNumeros()
        
    }
    
    func actualizarValor(){
        var1.text = v1+v2+v3
    }
    
    func selectorNumeros(){
        self.numeros.delegate = self
        self.numeros.dataSource = self
        
        valornumeros = [["0","1","2","3","4","5","6","7","8","9"],["0","1","2","3","4","5","6","7","8","9"],["0","1","2","3","4","5","6","7","8","9"]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Numero de componentes que tiene el scroll de numeros
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    //Tamaño maximo del componente del scroll de numeros
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    //Valor que se muestra en el scroll de numeros
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return valornumeros[component][row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        if (component == 0) {
            v1 = valornumeros[component][row] as String
        }
        if(component == 1){
            v2 = valornumeros[component][row] as String
        }
        if(component == 2) {
            v3 = valornumeros[component][row] as String
        }
        actualizarValor()
    }

}
