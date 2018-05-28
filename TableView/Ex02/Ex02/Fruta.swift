//
//  Item.swift
//  Ex02
//
//  Created by Leonardo Takuno on 22/05/2018.
//  Copyright © 2018 academysenac. All rights reserved.
//

import UIKit

class Fruta: NSObject {
    var nome: String
    var valor: Float
    
    init(nome: String, valor: Float){
        self.nome = nome
        self.valor = valor
    }
    
    convenience init(aleatorio: Bool = false){
        if aleatorio {
            let frutas = ["banana", "maçã", "pera", "uva", "goiaba", "melancia"]
            let valor:[Float] = [1.0, 0.9, 1.2, 1.4, 1.1, 2.5]
            
            let i = Int(arc4random_uniform(UInt32(frutas.count)))
            self.init(nome: frutas[i], valor: valor[i])
        } else {
            self.init(nome: "", valor: 0.0)
        }
    }
}
