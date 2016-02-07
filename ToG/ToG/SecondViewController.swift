//
//  secondViewController.swift
//  ToG
//
//  Created by Y,Y on 2015/12/20.
//  Copyright © 2015年 Y_Y. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var label:UILabel!
    @IBOutlet var label2:UILabel!
    var minute:Int=0
    var hour:Int=0
    let saveDate: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var usetime:Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label2.text = "\(hour)時間\(minute)分完了"
        // Do any additional setup after loading the view.
    }

    @IBAction func use(){
        
    }
    @IBAction func tameru(){
        
    }
    @IBAction func back(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ModelSanViewController" {
            
            let sanViewController = segue.destinationViewController as! SanViewController
            sanViewController.minute = minute
            sanViewController.hour = hour
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
