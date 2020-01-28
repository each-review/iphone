//
//  ClockViewController.swift
//  iPhoneProject
//
//  Created by jeongminho on 2020/01/11.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {
    
    
    lazy var models: [Country] = [korea, america]
    
    let korea: Country = Country(name: "한국", timeZone: "KST")
    let america: Country = Country(name: "미국", timeZone: "PDT")
    
//    let korea: Country = Country(name: "한국", timeZone: "KST", countryIdentifier: "kr_KR")
//    let america: Country = Country(name: "미국", timeZone: "PDT", countryIdentifier:  "en_US")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
}


    

// MARK: - Data Source
extension ClockViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dequeued = tableView.dequeueReusableCell(withIdentifier: "ClockTableViewCell", for: indexPath)
        
        guard let cell = dequeued as? ClockTableViewCell else {
            return dequeued
        }
        
        cell.country = models[indexPath.row]
        cell.separatorInset = .zero
        cell.backgroundColor = cell.contentView.backgroundColor
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}


// MARK: - Delegate
extension ClockViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

