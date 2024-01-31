//
//  ViewController.swift
//  SearchableTableView
//
//  Created by Karumuri Sujay on 23.12.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(filteredData.isEmpty) {
            return data.count
        }
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if(filteredData.isEmpty) {
            cell.textLabel?.text = data[indexPath.row]
        } else {
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        return cell
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        filteredtext(text: textField.text! + string)
        return true
    }
    
    
    
    func filteredtext(text:String) {
        filteredData.removeAll()
        for string in data {
            if string.starts(with: text) {
                filteredData.append(string)
            }
        }
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var field: UITextField!
    var data = [String]()
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        field.becomeFirstResponder()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        field.delegate = self
    }

    func setupData() {
        data.append("john")
        data.append("lincoln")
        data.append("abhraham")
        data.append("sujay")
        data.append("soujanya")
        data.append("suresh")
        data.append("so1")
        data.append("so2")
        data.append("so3")
    }
}

