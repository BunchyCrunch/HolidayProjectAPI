//
//  HolidayTableViewController.swift
//  HolidayAPI
//
//  Created by Josh Sparks on 10/2/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import UIKit

class HolidayTableViewController: UITableViewController {
    
    var localHolidays = [Holidays]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HolidayController.fetchHoliday { (holidays) in
            self.localHolidays = holidays
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localHolidays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "holidayCell", for: indexPath)
        let holidayArray = localHolidays
        let holiday = holidayArray[indexPath.row]
        
        cell.textLabel?.text = holiday.name
        cell.detailTextLabel?.text = holiday.date
        
        return cell
    }
    
} // end of class
