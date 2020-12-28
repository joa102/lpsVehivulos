//
//  newExperimento.swift
//  Esta clase esta diseñada para poder añadir nuevo experimento
//  de forma manual y automatica acompañado de la gestion del scroll,
//  ruleta de numeros y otro estilos de diseño.
//
//  Created by Alberto Fuentes on 25/11/20.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit
import CoreData

class newExperimento: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // VARIABLES
    var vehiculos:[NSManagedObject] = []
    
    var valornumeros:[[String]] = [[String]]()
    
    var v1 :String = "0", v2 :String = "0", v3 :String = "0"
    
    var valor: String = "000"
    var clase: String = "Desconocido"
    
    var num1 = 0, num2 = 0, num3 = 0 , num4 = 0, num5 = 0,
    num6 = 0, num7 = 0, num8 = 0 , num9 = 0, num10 = 0,
    num11 = 0, num12 = 0, num13 = 0 , num14 = 0, num15 = 0;
    
    // CONSTRUCTOR INCIAL
    override func viewDidLoad() {
        super.viewDidLoad()
        selectorNumeros()
    }
    // CONEXIONES
    
    // Botones
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    @IBOutlet weak var btn12: UIButton!
    @IBOutlet weak var btn14: UIButton!
    @IBOutlet weak var btn13: UIButton!
    @IBOutlet weak var btn15: UIButton!
    
    // Otras conexiones
    @IBOutlet weak var logoVehiculo: UIImageView!
    @IBOutlet weak var imagenVehiculo: UIImageView!
    @IBOutlet weak var numeros: UIPickerView!
    
    // ACCIONES
    @IBAction func Boton1(_ sender: Any) {
        num1 = Int(valor) ?? 0;
        btn1.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton2(_ sender: Any) {
        num2 = Int(valor) ?? 0;
        btn2.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton3(_ sender: Any) {
        num3 = Int(valor) ?? 0;
        btn3.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton4(_ sender: Any) {
        num4 = Int(valor) ?? 0;
        btn4.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton5(_ sender: Any) {
        num5 = Int(valor) ?? 0;
        btn5.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton6(_ sender: Any) {
        num6 = Int(valor) ?? 0;
        btn6.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton7(_ sender: Any) {
        num7 = Int(valor) ?? 0;
        btn7.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton8(_ sender: Any) {
        num8 = Int(valor) ?? 0;
        btn8.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton9(_ sender: Any) {
        num9 = Int(valor) ?? 0;
        btn9.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton10(_ sender: Any) {
        num10 = Int(valor) ?? 0;
        btn10.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton11(_ sender: Any) {
        num11 = Int(valor) ?? 0;
        btn11.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton12(_ sender: Any) {
        num12 = Int(valor) ?? 0;
        btn12.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton13(_ sender: Any) {
        num13 = Int(valor) ?? 0;
        btn13.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton14(_ sender: Any) {
        num14 = Int(valor) ?? 0;
        btn14.setTitle(valor, for: .normal);
    }
    
    @IBAction func Boton15(_ sender: Any) {
        num15 = Int(valor) ?? 0;
        btn15.setTitle(valor, for: .normal);
    }
    
    // Guardar al historial de experimentos
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "guardarExperimento" {
                guardar(clase: clase, num1: num1, num2: num2, num3: num3, num4: num4, num5: num5, num6: num6, num7: num7, num8: num8, num9: num9, num10: num10, num11: num11, num12: num12, num13: num13, num14: num14, num15: num15)
            }
    }
    
    // Seleccionar tipo de Vehiculo
    @IBAction func seleccionarClase(_ sender: Any) {
        
        //Creacion de la alerta
        let alerta = UIAlertController(title: "Seleccionar clase",
                                       message: "Selecciona el tipo de vehiculo",
                                       preferredStyle: UIAlertController.Style.actionSheet)
        
        //Tipo opel
        let opel = UIAlertAction(title :"Opel 4000",
                                 style: UIAlertAction.Style.default) { _ in
                                    self.clase = "Opel 4000"
                                    self.imagenVehiculo.image = UIImage(named:"Opel3D")
                                    self.logoVehiculo.image = UIImage(named:"logoOpel")
                                    alerta.dismiss(animated: true, completion: nil)
        }
        
        //Tipo saab
        let saab = UIAlertAction(title :"Saab 900",
                                 style: UIAlertAction.Style.default) { _ in
                                    self.clase = "Saab 900"
                                    self.imagenVehiculo.image = UIImage(named:"Saab3D")
                                    self.logoVehiculo.image = UIImage(named:"logoSaab")
                                    self.imagenVehiculo.reloadInputViews()
                                    alerta.dismiss(animated: true, completion: nil)
        }
        
        //Tipo furgoneta
        let furgo = UIAlertAction(title :"Furgoneta",
                                  style: UIAlertAction.Style.default) { _ in
                                    self.clase = "Furgoneta"
                                    self.imagenVehiculo.image = UIImage(named:"furgoneta3D")
                                    self.logoVehiculo.image = UIImage(named:"logoChevrolet")
                                    alerta.dismiss(animated: false, completion: nil)
        }
        
        //Tipo autobus
        let bus = UIAlertAction(title :"Autobus",
                                style: UIAlertAction.Style.default) { _ in
                                    
                                    self.clase = "Autobus"
                                    self.imagenVehiculo.image = UIImage(named:"Autobus3D")
                                    self.logoVehiculo.image = UIImage(named:"logoBus")
                                    alerta.dismiss(animated: false, completion: nil)
        }
        
        //Cerrar
        let cerrar = UIAlertAction(title :"Cerrar",
                                   style: UIAlertAction.Style.destructive) { _ in
                                    alerta.dismiss(animated: true, completion: nil)
        }
        
        //Añadir atributos en la alerta
        alerta.addAction(opel)
        alerta.addAction(saab)
        alerta.addAction(furgo)
        alerta.addAction(bus)
        alerta.addAction(cerrar)
        
        self.present(alerta, animated: false, completion: nil)
    }
    
    //GUARDAR VALOR EN COREDATA
    func guardar(clase: String, num1: Int, num2: Int, num3: Int,num4: Int , num5: Int, num6: Int, num7: Int, num8: Int, num9: Int, num10: Int, num11: Int, num12: Int, num13: Int, num14: Int, num15: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Vehiculo", in: managedContext)!
        let vehiculo = NSManagedObject(entity: entity, insertInto: managedContext)
        
        
        vehiculo.setValue(clase, forKeyPath: "clase")
        vehiculo.setValue(num1, forKeyPath: "compacidad")
        vehiculo.setValue(num2, forKeyPath: "circularidad")
        vehiculo.setValue(num3, forKeyPath: "distanciaCircularidad")
        vehiculo.setValue(num4, forKeyPath: "relacionAspectoEje")
        vehiculo.setValue(num5, forKeyPath: "relacionRadio")
        vehiculo.setValue(num6, forKeyPath: "aspectoLongitudMaxima")
        vehiculo.setValue(num7, forKeyPath: "elongacion")
        vehiculo.setValue(num8, forKeyPath: "rectangularidadEje")
        vehiculo.setValue(num9, forKeyPath: "variacionEscalonadaEjeMayor")
        vehiculo.setValue(num10, forKeyPath: "variacionescalonadaEjeMenor")
        vehiculo.setValue(num11, forKeyPath: "longitudMaximaRectangularidad")
        vehiculo.setValue(num12, forKeyPath: "radioZonasVacias")
        vehiculo.setValue(num13, forKeyPath: "oblicuidadEjeMayor")
        vehiculo.setValue(num14, forKeyPath: "curtosisEjeMenor")
        vehiculo.setValue(num15, forKeyPath: "curtosisEjeMayor")
        vehiculo.setValue(Date(), forKeyPath: "fecha")
        
        do {
            try managedContext.save()
            vehiculos.append(vehiculo)
        } catch let error as NSError {
            print("Ha ocurrido un error al añadir el experimento, \(error), \(error.userInfo)")
        }
    }
    
    //CONTROL DE NUMERO Y VALOR
    func actualizarValor(){
        valor = v1+v2+v3
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
