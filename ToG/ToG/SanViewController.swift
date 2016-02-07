//
//  SanViewController.swift
//  ToG
//
//  Created by Y,Y on 2016/01/10.
//  Copyright © 2016年 Y_Y. All rights reserved.
//

import UIKit

class SanViewController: UIViewController {
    var second:Int!
    var minute:Int!
    var hour:Int!
    var timer:NSTimer = NSTimer()
    let saveDate:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var ruikeiminute:Int=0
    var ruikeihour:Int=0
    @IBOutlet var label:UILabel!
    @IBOutlet var label2:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ruikeihour = saveDate.integerForKey("ruikeiho")
        ruikeiminute = saveDate.integerForKey("ruikeimin")
        ruikeihour = ruikeihour + hour
        ruikeiminute = ruikeiminute + minute
        label.text = "\(ruikeihour)時間"
        label2.text = "\(ruikeiminute)分"
        saveDate.setInteger(ruikeiminute, forKey: "ruikeimin")
        saveDate.setInteger(ruikeihour, forKey: "ruikeiho")
        saveDate.synchronize()

        // Do any additional setup after loading the view.
    }
    @IBAction func back(){
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ModelYonViewController" {
            
            let yonViewController = segue.destinationViewController as! YonViewController
            yonViewController.minute = minute
            yonViewController.hour = hour
            yonViewController.ruikeiminute = ruikeiminute
            yonViewController.ruikeihour = ruikeihour
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
