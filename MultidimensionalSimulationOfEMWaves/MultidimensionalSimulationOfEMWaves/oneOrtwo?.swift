import Foundation



public func _1Dor2D(choose1Dor2D _1or2: Int)-> Int{
    
    if (_1or2 == 1) {
    

        //set electric field coefficients
        SetElectricFieldCoefficient(Size: SIZE, LOSS_LAYER: LOSS_LAYER, impedance: impedance,
                                    relativePermittivity: relativePermittivity, LOSS: LOSS)

        //set magnetic field coefficients
        SetMagneticFieldCoefficient(Size: SIZE, LOSS_LAYER: LOSS_LAYER,
                                    impedance: impedance, LOSS: LOSS)

        
        
            
        }
            else if (_1or2 == 2){
        
                UpdateElectricMagenticCoefficients2D(courantDIVimp: courantDIVimp, courantximp: courantximp)
                  
                    

                UpdateCoefficients1DAuxillary(courantDIVimp: courantDIVimp, courantximp: courantximp)

        
             
            }
    
    else{
        print("Choose either 1 or 2")
    }
    
    
    
    return _1or2
    
    
}





public func TDialectric_yes_or_no(_0forno_1foryes a: Int)-> Int{
    
    
    var b = 0
    
    if a == 0{
        
        b = 0
        
    } else
        
    {
        b = 1
    }
    
    
    
    return b
}



