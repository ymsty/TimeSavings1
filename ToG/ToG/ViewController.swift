//
//  ViewController.swift
//  ToG
//
//  Created by Y,Y on 2015/12/20.
//  Copyright © 2015年 Y_Y. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    var second:Int=0
    var minute:Int=0
    var hour:Int=0
    var timer:NSTimer = NSTimer()
    let saveDate:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    //後で調整
    let count = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func start(){
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("up"), userInfo: nil, repeats: true)
        }
    }

    @IBAction func stop(){
        if timer.valid {
            timer.invalidate()
            hour = 0
            minute = 0
            second = 0
            label.text = "\(hour)時間\(minute)分\(second)秒"
        }
    }
    func up() {
        second = second + 1
        if second == count {
            minute = minute + 1
            second = 0
        }
        if minute == count {
            hour = hour + 1
            minute = 0
        }
        label.text = "\(hour)時間\(minute)分\(second)秒"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //次の画面に値を受け渡す！！
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ModelSecondViewController" {
            
            let secondViewController = segue.destinationViewController as! SecondViewController
            secondViewController.minute = minute
            secondViewController.hour = hour
        }
    }

}

