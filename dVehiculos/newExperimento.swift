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
    @IBAction func Boton1(_ sender: Any) {
    }
    
    @IBAction func Boton2(_ sender: Any) {
    }
    @IBAction func Boton3(_ sender: Any) {
    }
    
    @IBAction func Boton4(_ sender: Any) {
    }
    @IBAction func Boton5(_ sender: Any) {
    }
    @IBAction func Boton6(_ sender: Any) {
    }
    @IBAction func Boton7(_ sender: Any) {
    }
    @IBAction func Boton8(_ sender: Any) {
    }
    @IBAction func Boton9(_ sender: Any) {
    }
    @IBAction func Boton10(_ sender: Any) {
    }
    @IBAction func Boton11(_ sender: Any) {
    }
    @IBAction func Boton12(_ sender: Any) {
    }
    @IBAction func Boton13(_ sender: Any) {
    }
    @IBAction func Boton14(_ sender: Any) {
    }
    
    @IBAction func Boton15(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Variables
    var valornumeros:[[String]] = [[String]]()
    var v1 :String = "0"
    var v2 :String = "0"
    var v3 :String = "0"
    var valor: String = "000"
    var num1 = 0, num2 = 0, num3 = 0 , num4 = 0, num5 = 0,
        num6 = 0, num7 = 0, num8 = 0 , num9 = 0, num10 = 0,
        num11 = 0, num12 = 0, num13 = 0 , num14 = 0, num15 = 0;
    
    
    //Constructor inicial
    override func viewDidLoad() {
        super.viewDidLoad()
        selectorNumeros()
        
    }
    
    func actualizarValor(){
        //var.text = v1+v2+v3
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
