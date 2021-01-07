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
        calcularClase()
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
        calcularClase()
    }
    
    @IBAction func Boton2(_ sender: Any) {
        num2 = Int(valor) ?? 0;
        btn2.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton3(_ sender: Any) {
        num3 = Int(valor) ?? 0;
        btn3.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton4(_ sender: Any) {
        num4 = Int(valor) ?? 0;
        btn4.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton5(_ sender: Any) {
        num5 = Int(valor) ?? 0;
        btn5.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton6(_ sender: Any) {
        num6 = Int(valor) ?? 0;
        btn6.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton7(_ sender: Any) {
        num7 = Int(valor) ?? 0;
        btn7.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton8(_ sender: Any) {
        num8 = Int(valor) ?? 0;
        btn8.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton9(_ sender: Any) {
        num9 = Int(valor) ?? 0;
        btn9.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton10(_ sender: Any) {
        num10 = Int(valor) ?? 0;
        btn10.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton11(_ sender: Any) {
        num11 = Int(valor) ?? 0;
        btn11.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton12(_ sender: Any) {
        num12 = Int(valor) ?? 0;
        btn12.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton13(_ sender: Any) {
        num13 = Int(valor) ?? 0;
        btn13.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton14(_ sender: Any) {
        num14 = Int(valor) ?? 0;
        btn14.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    @IBAction func Boton15(_ sender: Any) {
        num15 = Int(valor) ?? 0;
        btn15.setTitle(valor, for: .normal);
        calcularClase()
    }
    
    // Guardar al historial de experimentos
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "guardarExperimento" {
                guardar(clase: clase, num1: num1, num2: num2, num3: num3, num4: num4, num5: num5, num6: num6, num7: num7, num8: num8, num9: num9, num10: num10, num11: num11, num12: num12, num13: num13, num14: num14, num15: num15)
            }
    }
    @IBAction func informacionVehiculos(_ sender: Any) {
        var mensajeVehiculo = ""
        switch (self.clase) {
        case "Opel Manta 400":
            mensajeVehiculo = "El Opel Manta 400 es un automóvil deportivo de tracción trasera fabricado por Opel como subsidiaria de General Motors (GM) desde 1970 hasta 1988. \nSe trata de un cupé deportivo derivado del Opel Ascona, con el cual se pensó competir contra el Ford Capri. Fue el sucesor del Opel GT de primera generación, tuvo tres generaciones y fue reemplazado por el Opel Calibra en 1988."
            break
        case "Saab 900":
            mensajeVehiculo = "El Saab 900 es un automóvil de tamaño medio que fue producido por Saab desde 1978 hasta 1998 en dos generaciones. La primera generación de 1978 a 1994 se conoce como la `clásica` y la generación de 1994 a 1998 se conoce como la `nueva generación`. \nEl Saab 900 `clásico` se basó en el chasis del Saab 99, aunque con una parte delantera más larga para cumplir con las normas de los EE.UU. sobre choques frontales. El 900 se fabricó en configuraciones de sedán de 2 y 4 puertas y de hatchback de 3 y 5 puertas y, a partir de 1986, como modelo cabriolet (convertible). Había carburadores de uno y dos centímetros, con inyección de combustible y turbocompresor, incluyendo tanto el Turbo de Presión Completa (FPT), como, en los modelos europeos de principios de los 90, Turbos de Baja Presión (LPT)."
            break
        case "Furgoneta":
            mensajeVehiculo = "La Chevrolet Van es una furgoneta realizada por General Motors para Chevrolet. El término `Chevrolet Van` también se refiere a toda la serie de camionetas vendidas por Chevrolet. \nLa primera camioneta fue lanzada en 1961 en la plataforma de Corvair, y la última camioneta Chevrolet en la producción es la Chevrolet Express. Fue fabricada entre 1964 y 1996."
            break
        case "Autobus":
            mensajeVehiculo = "Mientras que los autobuses de dos pisos para cubrir largas distancias están extendidos por todo el mundo, los usados para transporte público en ciudades son menos comunes. Son bastantes populares en algunas ciudades europeas y en algunas partes de Asia."
            break
        default:
            mensajeVehiculo = "No hay ninguna información. Todavia no se ha seleccionado ningun vehiculo"
            
        }
        //Creacion de la alerta
        let alerta = UIAlertController(title: self.clase,
                                       message: mensajeVehiculo,
                                       preferredStyle: UIAlertController.Style.actionSheet)
        
        //Cerrar
        let cerrar = UIAlertAction(title :"Cerrar",
                                   style: UIAlertAction.Style.destructive) { _ in
                                    alerta.dismiss(animated: true, completion: nil)
        }
        alerta.addAction(cerrar)
        
        self.present(alerta, animated: false, completion: nil)
    }
    
    // Seleccionar tipo de Vehiculo
    @IBAction func seleccionarClase(_ sender: Any) {
        
        //Creacion de la alerta
        let alerta = UIAlertController(title: "Seleccionar clase",
                                       message: "Selecciona el tipo de vehiculo",
                                       preferredStyle: UIAlertController.Style.actionSheet)
        
        //Tipo opel
        let opel = UIAlertAction(title :"Opel Manta 400",
                                 style: UIAlertAction.Style.default) { _ in
                                    self.clase = "Opel Manta 400"
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
        vehiculo.setValue(num4, forKeyPath: "relacionRadio")
        vehiculo.setValue(num5, forKeyPath: "relacionAspectoEje")
        vehiculo.setValue(num6, forKeyPath: "aspectoLongitudMaxima")
        vehiculo.setValue(num7, forKeyPath: "elongacion")
        vehiculo.setValue(num8, forKeyPath: "relacionDispersion")
        vehiculo.setValue(num9, forKeyPath: "longitudMaximaRectangularidad")
        vehiculo.setValue(num10, forKeyPath: "variacionEscalonadaEjeMayor")
        vehiculo.setValue(num11, forKeyPath: "variacionescalonadaEjeMenor")
        vehiculo.setValue(num12, forKeyPath: "oblicuidadEjeMayor")
        vehiculo.setValue(num13, forKeyPath: "curtosisEjeMayor")
        vehiculo.setValue(num14, forKeyPath: "curtosisEjeMenor")
        vehiculo.setValue(num15, forKeyPath: "radioZonasVacias")
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
    
    func calcularClase(){
        var resultados = [claseOpel(), claseFurgoneta(), claseSaab() , claseAutobus()]
        var maximo = resultados[0]
        for i in resultados{
            if (maximo < i){
                maximo = i
            }
        }
        if(claseOpel() == maximo){
            self.clase = "Opel Manta 400"
            self.imagenVehiculo.image = UIImage(named:"Opel3D")
            self.logoVehiculo.image = UIImage(named:"logoOpel")
        }
        if(claseFurgoneta() == maximo){
            self.clase = "Furgoneta"
            self.imagenVehiculo.image = UIImage(named:"furgoneta3D")
            self.logoVehiculo.image = UIImage(named:"logoChevrolet")
        }
        if(claseSaab() == maximo){
            self.clase = "Saab 900"
            self.imagenVehiculo.image = UIImage(named:"Saab3D")
            self.logoVehiculo.image = UIImage(named:"logoSaab")
        }
        if(claseAutobus() == maximo){
            self.clase = "Autobus"
            self.imagenVehiculo.image = UIImage(named:"Autobus3D")
            self.logoVehiculo.image = UIImage(named:"logoBus")
        }
        print(self.clase)
    }

}
