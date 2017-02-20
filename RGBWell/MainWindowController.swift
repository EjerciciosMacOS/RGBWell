//
//  MainWindowController.swift
//  RGBWell
//
//  Created by Leonardo Guzman on 2/12/17.
//  Copyright © 2017 Leonardo Guzman. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var colorWellControl : NSColorWell?;
    @IBOutlet weak var htmlControl : NSTextField?;
    
    @IBOutlet weak var rojoSliderControl : NSSlider?;
    @IBOutlet weak var rojoTextfieldControl : NSTextField?;
    
    @IBOutlet weak var verdeSliderControl : NSSlider?;
    @IBOutlet weak var verdeTextfieldControl : NSTextField?;
    
    @IBOutlet weak var azulSliderControl : NSSlider?;
    @IBOutlet weak var azulTextfieldControl : NSTextField?;
    
    var rojo = 0.0;
    var verde = 0.0;
    var azul = 0.0;
    let alpha = 1.0;
    
    
    //Metodo que sobre escribe el atributo que obtiene el NIB del controlador
    override var windowNibName: String?{
        return "MainWindowController";
    }
    
    
    //Metodo que se ejecuta cuando la vista se ha cargado
    override func windowDidLoad() {
        super.windowDidLoad();
        onInit();
    }
    
    
    //Metodo que inicializa los controles
    func onInit() {
        
        if let control = rojoSliderControl{
            control.doubleValue = rojo;
        }
        
        if let control = verdeSliderControl{
            control.doubleValue = verde;
        }
        
        if let control = azulSliderControl{
            control.doubleValue = azul;
        }
        
        editarColor();
    }
    
    
    //Metodo que se ejecuta cuando se mueve el slider correspondiente al color rojo
    @IBAction func ajustarRojo(sender : NSSlider){
        
        rojo = sender.doubleValue;
        editarColor();

    }
    
    
    //Metodo que se ejecuta cuando se mueve el slider correspondiente al color verde
    @IBAction func ajustarVerde(sender : NSSlider){
        
        verde = sender.doubleValue;
        editarColor();


    }
    
    
    //Metodo que se ejecuta cuando se mueve el slider correspondiente al color azul
    @IBAction func ajustarAzul(sender : NSSlider){
        
        azul = sender.doubleValue;
        editarColor();

    }
    
    
    //Metodo que edita el color del colorWell dado los parametros
    func editarColor(){
        
        let color = NSColor(red: CGFloat(rojo), green: CGFloat(verde), blue: CGFloat(azul), alpha: CGFloat(alpha));
        
        if let colorControl = colorWellControl{
         
            colorControl.color = color;
        }
        
        
        let formatoHtml = String(format: "#%02x%02x%02x", Int(rojo * 255), Int(verde * 255),Int(azul * 255));
        
        if let control = htmlControl{
            control.stringValue = formatoHtml;
        }
        
        if let control = rojoTextfieldControl {
            control.intValue = Int32( rojo * 255 );
        }
        
        if let control = verdeTextfieldControl {
            control.intValue = Int32( verde * 255 );
        }
        
        if let control = azulTextfieldControl {
            control.intValue = Int32( azul * 255 );
        }
    }
}
