//
//  FiveViewController.swift
//  ToG
//
//  Created by Y,Y on 2016/01/10.
//  Copyright © 2016年 Y_Y. All rights reserved.
//

import UIKit

class FiveViewController: UIViewController {
    var useminute:Int=0
    var second:Int = 0
    var usehour:Int=0
    var ruikeiminute:Int=0
    var ruikeihour:Int=0
    var timer:NSTimer = NSTimer()
    @IBOutlet var label:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("down"), userInfo: nil, repeats: true)
        label.text = "\(usehour)時\(useminute)分\(second)秒"
        // Do any additional setup after loading the view.
    }
    func down(){
        second = second - 1
        
        if second < 0 {
            second = 59
            useminute = useminute - 1
        }
        
        if useminute < 0 {
            useminute = 59
            usehour = usehour - 1
        }
        
        
        
//        if useminute < 0 && second < 0 {
//                usehour = usehour - 1
//                useminute = 59
//                second = 59
//        }
        
        label.text = "\(usehour)時\(useminute)分\(second)秒"
        if usehour == 0 && useminute == 0 && second == 0{
            let alert = UIAlertController(title: "終了", message: "時間を全て使い終えました", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(
                    UIAlertAction(
                        title: "OK", style: UIAlertActionStyle.Default, handler: {
                            action in
                            
                            self.dismissViewControllerAnimated(true, completion: nil)
                }
                    )
                )
                presentViewController(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
