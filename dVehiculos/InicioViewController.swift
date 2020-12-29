//
//  InicioViewController.swift
//  dVehiculos
//
//  Created by Aula11 on 3/12/20.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit
import CoreData

class InicioViewController: UIViewController {

    // CONEXIONES
    @IBOutlet weak var ImagenUsuarioInicio: UIImageView!
    @IBOutlet weak var nombreUsuarioInicio: UILabel!
    @IBOutlet weak var correoUsuarioInicio: UILabel!
    
    // VARIABLES
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var usuarioLogeado: Persona? //Inicializada en Login
    
    // CONSTRUCTOR INICIAL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Si el usuario no se ha recibido
        if(usuarioLogeado == nil){
            print("Error no se ha recibido ningun usuario")
            performSegue(withIdentifier: "cerrarSesion", sender: self)
        }else{
            nombreUsuarioInicio.text = usuarioLogeado?.nombre
            correoUsuarioInicio.text = usuarioLogeado?.email
            ImagenUsuarioInicio.image = UIImage(data: (usuarioLogeado?.imagen_perfil! as Data?)!)
        }
        
    }
}
