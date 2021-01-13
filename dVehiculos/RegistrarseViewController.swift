//
//  RegistrarseViewController.swift
//  dVehiculos
//
//  Created by Aula11 on 14/12/20.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit

class RegistrarseViewController: UIViewController {

    // CONEXIONES
    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var emailUsuario: UITextField!
    @IBOutlet weak var contrasenaUsuario: UITextField!
    @IBOutlet weak var recontrasenaUsuario: UITextField!
    @IBOutlet weak var selectorImagen: UISegmentedControl!
    @IBOutlet weak var imagenUsuario: UIImageView!
    
    // VARIABLES
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // CONSTRUCTOR INICIAL
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenUsuario.image = UIImage(named: "user0")
    }
    
    // SELECCIONAR IMAGEN
    @IBAction func seleccionarImagen(_ sender: Any) {
        switch (selectorImagen.selectedSegmentIndex) {
        case 1:
            imagenUsuario.image = UIImage(named: "user1")
            break
        case 2:
            imagenUsuario.image = UIImage(named: "user2")
            break
        case 3:
            imagenUsuario.image = UIImage(named: "user3")
            break
        case 4:
            imagenUsuario.image = UIImage(named: "user4")
            break
        case 5:
            imagenUsuario.image = UIImage(named: "user5")
            break
        case 6:
            imagenUsuario.image = UIImage(named: "user6")
            break
        case 7:
            imagenUsuario.image = UIImage(named: "user7")
            break
        case 8:
            imagenUsuario.image = UIImage(named: "user8")
            break
        default:
            imagenUsuario.image = UIImage(named: "user0")
        }
    }
    
    // REGISTRARSE
    @IBAction func registrarse(_ sender: UIButton) {
        let nombre = nombreUsuario.text
        let email = emailUsuario.text
        let contrasena = contrasenaUsuario.text
        let recontrasena = recontrasenaUsuario.text
        
        //Comprueba si las contraseñas son las mismas
        if(contrasena == recontrasena){
            let newUsuario = Persona(context: self.context)
            
            newUsuario.nombre = nombre
            newUsuario.email = email
            newUsuario.password = contrasena
            newUsuario.imagen_perfil = (imagenUsuario.image?.pngData()! as NSData?)
            
            do{
                try self.context.save()
                
                print("Exito al registrarse")
                // Alerta de registro existoso
                let alert = UIAlertController(title: "Registrado correctamente", message: "Ya puede iniciar sesión", preferredStyle: .alert)
                let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
                subview.layer.cornerRadius = 5
                subview.backgroundColor = UIColor(red: (53/255.0), green: (254/255.0), blue: (139/255.0), alpha: 1.0)
                self.present(alert, animated: true, completion: nil)
                
                let duracion = DispatchTime.now() + 5
                DispatchQueue.main.asyncAfter(deadline: duracion){
                    alert.dismiss(animated: true, completion: nil)
                }
                
                performSegue(withIdentifier: "iniciarSesion", sender: self)
            
            }catch{
                
                print("Fallo al registrarse")
                // Alerta fallo a la hora de registrarse
                let alert = UIAlertController(title: "No se pudo registrar", message: "Ha ocurrido un fallo, vuelva a intentarlo de nuevo", preferredStyle: .alert)
                let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
                subview.layer.cornerRadius = 5
                subview.backgroundColor = UIColor(red: (247/255.0), green: (108/255.0), blue: (78/255.0), alpha: 1.0)
                self.present(alert, animated: true, completion: nil)
                
                let duracion = DispatchTime.now() + 5
                DispatchQueue.main.asyncAfter(deadline: duracion){
                    alert.dismiss(animated: true, completion: nil)
                }
            }
        }
        else{
            
            print("Fallo de contraseñas")
            // Alerta de que las contraseñas no son iguales
            let alert = UIAlertController(title: "", message: "Verifica la contraseña, no son iguales.", preferredStyle: .alert)
            let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
            subview.layer.cornerRadius = 5
            subview.backgroundColor = UIColor(red: (247/255.0), green: (108/255.0), blue: (78/255.0), alpha: 1.0)
            self.present(alert, animated: true, completion: nil)
            
            let duracion = DispatchTime.now() + 5
            DispatchQueue.main.asyncAfter(deadline: duracion){
                alert.dismiss(animated: true, completion: nil)
            }
        }
    }
}
