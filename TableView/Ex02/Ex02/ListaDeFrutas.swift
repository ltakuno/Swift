//
//  ItemStore.swift
//  Ex02
//
//  Created by Leonardo Takuno on 22/05/2018.
//  Copyright © 2018 academysenac. All rights reserved.
//

import UIKit

class ListaDeFrutas {
    var frutas = [Fruta]()
    
    init(){
        for _ in 0..<5 {
            gerarNovaFruta()
        }
    }
    
    @discardableResult func gerarNovaFruta() -> Fruta {
        let fruta = Fruta(aleatorio: true)
        frutas.append(fruta)
        return fruta
    }
    
    func removerFruta(_ fruta: Fruta){
        if let index = frutas.index(of: fruta) {
            frutas.remove(at: index)
        }
    }
    
    func moverFruta(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex {
            return
        }
        let fruta = frutas[fromIndex]
        frutas.remove(at: fromIndex)
        frutas.insert(fruta, at: toIndex)
    }
}
