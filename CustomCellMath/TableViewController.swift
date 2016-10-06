//
//  TableViewController.swift
//  CustomCellMath
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var doNotCrash = "this is a string"
    
    // an array of arrays
    // i.e. [[1, 2, 3, 4], [5, 3, 1, 0], [5, 2, 6, 6]]
    var numbers: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mathCell", for: indexPath) as! MathTableViewCell
        
        let numbersRow = numbers[indexPath.row] //selected array
        
        cell.firstNumberLabel.text = String("\(numbersRow[0])")
        cell.secondNumberLabel.text = String("\(numbersRow[1])")
        cell.thirdNumberLabel.text = String("\(numbersRow[2])")
        cell.fourthNumberLabel.text = String("\(numbersRow[3])")
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check segue identifier. that you're in the right place
        if segue.identifier == "mathCell" {
            
            //setting var destination to the segue destination but have to cast it
            var destinationDisplayMathVC = segue.destination as! DisplayMathViewController
            
            //selected number
            let numberIndexPath = tableView.indexPathForSelectedRow?.row
            
            //            destinationDisplayMathVC.numbers = self.numbers[numberIndexPath!]
            //it's an optional so we have to unwrap it
            if let numberIndex = numberIndexPath {
                destinationDisplayMathVC.numbers = numbers[numberIndex]
            }
            /*
             SO! we were really close! 
             
             we declared a let destinationDisplay, etc to signify the destination for our data (the DisplayMathViewController)
             
             we make a constant numberIndexPath. thats how we define the selected cell's data (its an optional because it might not have any data)
             
             you could use the cheat i commented out, but Johann will be very upset
             
             so you have to unwrap the optional
             
             inside it says that the destination's numbers should equal the numbers in the (optional) indexPath!
             
             and then it shows up! Woooooo!
             
             
             */
            
            
        }
    }
    
}



// MARK: - Generating an array of Data
extension TableViewController {
    
    func generateData() {
        for _ in 1...100 {
            var newNumberRow: [Int] = []
            
            for _ in 1...4 {
                let randomNumber = randomNumberFromOneTo(50)
                newNumberRow.append(randomNumber)
            }
            
            numbers.append(newNumberRow)
        }
    }
    
    func randomNumberFromOneTo(_ number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)) + 1)
    }
    
    
}
