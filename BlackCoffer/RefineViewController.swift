//
//  ViewController.swift
//  BlackCoffer
//
//  Created by Gokul Murugan on 17/11/23.
//

import UIKit

class RefineViewController: UIViewController {
    @IBOutlet weak var statusTextView: UITextView!
    @IBOutlet weak var valueOfSlider: UILabel!
    @IBOutlet weak var distanceSlider: UISlider!
    @IBOutlet weak var constrainToDrag: NSLayoutConstraint!
    @IBOutlet weak var coffeeButton: UIButton!
    @IBOutlet weak var matrimonyButton: UIButton!
    @IBOutlet weak var datingButton: UIButton!
    @IBOutlet weak var diningButton: UIButton!
    @IBOutlet weak var moviesButton: UIButton!
    @IBOutlet weak var friendshipButton: UIButton!
    @IBOutlet weak var hobbiesButton: UIButton!
    @IBOutlet weak var businessButton: UIButton!
    @IBOutlet weak var kmsLable: UILabel!
    @IBOutlet weak var displayLable: UILabel!
    @IBOutlet weak var displayTableView: UITableView!
    @IBOutlet weak var availabilityView: UIView!
    
    
    private var tableData =  ["Available | Hey Lets Connect", "Away | Stay Discreet And Watch", "Busy | Do Not Disturb | Will Catch Up Later", "SOS | Emergency! Need Assistance! HELP" ]
    private var tableViewHidden = true
    var purposeArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusTextView.layer.borderWidth = 1
        statusTextView.layer.borderColor = UIColor.gray.cgColor
        statusTextView.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buttonState(button: coffeeButton)
        buttonState(button: matrimonyButton)
        buttonState(button: moviesButton)
        buttonState(button: friendshipButton)
        buttonState(button: datingButton)
        buttonState(button: diningButton)
        buttonState(button: hobbiesButton)
        buttonState(button: businessButton)
        displayLable.text = tableData[0]
        displayTableView.isHidden = true
        displayTableView.separatorStyle = .none
        displayTableView.layer.borderColor = UIColor.gray.cgColor
        displayTableView.layer.borderWidth = 1
        displayTableView.layer.cornerRadius = 10
        availabilityView.layer.borderColor = UIColor.gray.cgColor
        availabilityView.layer.borderWidth = 1
        availabilityView.layer.cornerRadius = 10
        
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        constrainToDrag.constant = CGFloat(sender.value)
        kmsLable.text = "\(Int((sender.value/357)*100)) Kms"
        valueOfSlider.text = "\(Int((sender.value/357) * 100))"
    }
    
    @IBAction func purposeButtons(_ sender: UIButton) {
        if sender.backgroundColor == UIColor(named: "systemColor") {
            
            sender.backgroundColor = UIColor.white
            
            let index = purposeArray.firstIndex(of: (sender.titleLabel?.text!)!)
            purposeArray.remove(at: index!)
        } else {
            purposeArray.append((sender.titleLabel?.text!)!)
            
            sender.backgroundColor = UIColor(named: "systemColor")
            
            
        }
    }
    
    func buttonState(button: UIButton){
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        
    }
    
    @IBAction func availabilityButtonTapped(_ sender: Any) {
        if tableViewHidden{
            displayTableView.isHidden = false
            tableViewHidden = false
        } else {
            displayTableView.isHidden = true
            tableViewHidden = true
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        if purposeArray == []{
            
            let alert = UIAlertController(title: "Purpose must contain atleast 1 selection", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            
        } else {
            
            let toSaveData:Model = Model(availability: displayLable.text ?? "Available | Hey Lets Connect", status: statusTextView.text ?? "\("Hi community! I am open to new connections " + "😊")", diatance: kmsLable.text ?? "0", purpose: purposeArray)
           
            
            let alert = UIAlertController(title: "Successfully Saved", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    
}

extension RefineViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayTableView.deselectRow(at: indexPath, animated: true)
        displayLable.text = tableData[indexPath.row]
        displayTableView.isHidden = true
        tableViewHidden.toggle()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16.0)
        return cell
    }
    
    
    
    
    
}

