//
//  StopWatchViewController.swift
//  iPhoneProject
//
//  Created by jeongminho on 2020/01/12.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
        
    var labModels = [LabTable]()
    
    @IBOutlet weak var labTableView: UITableView!
    
    
    
    // 메인 타이머의 IBOutlet 객체
    @IBOutlet weak var mTimerLabel: UILabel!
    @IBOutlet weak var decimalTimerLabel: UILabel!
    @IBOutlet weak var labAndResetButton: UIButton!
    @IBOutlet weak var startAndStopButton: UIButton!
        
    var mainTimer: Timer?
    var timeCount = 0 {
        didSet {
            let timeString = self.timeLabelNumber(count: self.timeCount)
            self.mTimerLabel.text = timeString.0
            self.decimalTimerLabel.text = ".\(timeString.1)"
        }
    }
    
    
//    addClothesButton.layer.borderColor = UIColor.white.cgColor

    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        startAndStopButton.layer.cornerRadius = startAndStopButton.layer.frame.size.width / 2
        startAndStopButton.layer.borderColor = UIColor.white.cgColor
        startAndStopButton.layer.borderWidth = 2
        
        labAndResetButton.layer.cornerRadius = labAndResetButton.layer.frame.size.width / 2
        labAndResetButton.layer.borderColor = UIColor.white.cgColor
        labAndResetButton.layer.borderWidth = 2
        // Do any additional setup after loading the view.
    }
    
    func timeLabelNumber(count: Int) -> (String, String) {
        let decimalSec = (count % 10)
        let sec = (count / 10) % 60
        let min = (count / 10) / 60
        
        let sec_string = "\(sec)".count == 1 ? "0\(sec)" : "\(sec)"
        let min_string = "\(min)".count == 1 ? "0\(min)" : "\(min)"
        return ("\(min_string):\(sec_string)","\(decimalSec)")
    }
    
    func startButton() {
        mainTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timeCount += 1
        }
        if let timer = mainTimer {
            RunLoop.main.add(timer, forMode: .common)
        }
    }
    
    func stopButton() {
        mainTimer?.invalidate()
        mainTimer = nil
    }
    
    func resetButton() {
        mainTimer?.invalidate()
        mainTimer = nil
        timeCount = 0
        self.mTimerLabel.text = "00:00"
        self.decimalTimerLabel.text = "00"
        
        self.labModels.removeAll()
        self.labTableView.reloadData()
    }
    
    func labButton() {
        
        let timeString = self.timeLabelNumber(count: self.timeCount)
        let indexPath = IndexPath(row: self.labModels.count, section: 0)
        let labRecord = "\(timeString.0).\(timeString.1)"
        let lab = LabTable(number: self.labModels.count, labRecord: labRecord)
        self.labModels.append(lab)
        self.labTableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func startAndStopButtonTapped(_ sender: UIButton) {
        
        
        sender.isSelected.toggle()
        if sender.isSelected {
            
            startAndStopButton.tintColor = UIColor.clear
            startAndStopButton.setTitleColor(UIColor.systemBlue, for: .selected)
            startAndStopButton.setTitleColor(UIColor.systemBlue, for: .normal)
            startAndStopButton.setTitle("중지", for: .normal)
            labAndResetButton.setTitle("랩", for: .normal)
            startButton()
            
        } else {
            startAndStopButton.setTitle("시작", for: .normal)
            labAndResetButton.setTitle("재설정", for: .normal)
            stopButton()
        }
    }
    
    @IBAction func labAndResetButton(_ sender: UIButton) {
        if sender.currentTitle == "재설정" {
            self.resetButton()
        } else if sender.currentTitle == "랩" {
            labButton()
        }
    }
}

extension StopWatchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.labModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dequeued = tableView.dequeueReusableCell(withIdentifier: "StopWatchTableViewCell", for: indexPath)
        guard let cell = dequeued as? StopWatchTableViewCell else {
            return dequeued
        }

        let item = self.labModels[indexPath.row]
 
        cell.labMainTimer.text = item.labRecord
        cell.labRecord.text = "랩 \(item.number+1)"
        return cell
    }
}
