//
//  ViewController.swift
//  Ex02
//
//  Created by Leonardo Takuno on 22/05/2018.
//  Copyright © 2018 academysenac. All rights reserved.
//

import UIKit

class ListaViewController: UITableViewController {
    
    var listaDeFrutas: ListaDeFrutas!
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        listaDeFrutas = nil
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeFrutas.frutas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let fruta = listaDeFrutas.frutas[indexPath.row]
        
        cell.textLabel?.text = fruta.nome
        cell.detailTextLabel?.text = String(format: "R$ %.2f ", fruta.valor)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let fruta = listaDeFrutas.frutas[indexPath.row]
            listaDeFrutas.removerFruta(fruta)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        listaDeFrutas.moverFruta(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    @IBAction func addNewItem(_ sender: UIButton    ){

        let novaFruta = listaDeFrutas.gerarNovaFruta()
        
        if let index = listaDeFrutas.frutas.index(of: novaFruta){
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton    ){
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
}

