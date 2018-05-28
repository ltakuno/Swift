//
//  ViewController.swift
//  Ex01
//
//  Created by Leonardo Takuno on 21/05/2018.
//  Copyright © 2018 academysenac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var listaFrutas: UITableView!
    
    let frutas = ["banana", "maçã", "pera", "uva", "melancia", "caqui"]
    let valores = [1.2, 1.3, 0.8, 0.9, 2.0, 1.0]
    override func viewDidLoad() {
        super.viewDidLoad()
        listaFrutas.delegate = self
        listaFrutas.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frutas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listaFrutas.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = frutas[indexPath.row]
        cell?.detailTextLabel?.text = "\(valores[indexPath.row])"
        
        return cell!
    }
}

