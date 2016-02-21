
//
//  YonViewController.swift
//  ToG
//
//  Created by Y,Y on 2016/01/10.
//  Copyright © 2016年 Y_Y. All rights reserved.
//

import UIKit

class YonViewController: UIViewController {
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusBottun: UIButton!

    var minute:Int=0
    var hour:Int=0
    var ruikeiminute:Int=0
    var ruikeihour:Int=0
    var hozon:Int=0
    @IBOutlet var label:UILabel!
    @IBOutlet var label2:UILabel!
    @IBOutlet var label3:UILabel!
    var useminute:Int=0
    var usehour:Int=0
    let saveDate:NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        label3.text = "\(ruikeihour)時間\(ruikeiminute)分あります"

        minusButton.layer.borderWidth = 5
        plusBottun.layer.borderWidth = 5
        // Do any additional setup after loading the view.
    }
    @IBAction func back(){
    }
    
    @IBAction func plus(){
        useminute = useminute + 30
        if useminute == 60 {
            useminute = 0
            usehour = usehour + 1
        }
        label.text = "\(usehour)時間\(useminute)分使います"
    }
    
    @IBAction func minus(){
        if useminute == 0{
            if usehour >= 1{
                usehour = usehour - 1
                useminute = 30
            }
            
        }else if useminute == 30{
            useminute = 0
        }
        label.text = "\(usehour)時間\(useminute)分使います"
    }
    @IBAction func decide(){
        
        if ruikeihour*60+ruikeiminute < usehour*60 + useminute{
            let alert = UIAlertController(title: "エラー", message: "累計時間を上回っているため使う事が出来ません", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
            UIAlertAction(
                title: "OK", style: UIAlertActionStyle.Default, handler: {
                    action in
                    
                }
                )
            )
            presentViewController(alert, animated: true, completion: nil)
        }else if useminute == 0 && usehour == 0{
            let alert = UIAlertController(title: "エラー", message: "使う事が出来ません", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK", style: UIAlertActionStyle.Default, handler: {
                        action in
                        
                    }
                )
            )
            presentViewController(alert, animated: true, completion: nil)
        }else{
            ruikeihour = ruikeihour-usehour
            ruikeiminute = ruikeiminute-useminute
            if useminute > 0{
                ruikeihour = ruikeihour - 1
                ruikeiminute = ruikeiminute + 60
            }
            label3.text = "\(ruikeihour)時間\(ruikeiminute)分あります"
            saveDate.setInteger(ruikeiminute, forKey: "ruikeimin")
            saveDate.setInteger(ruikeihour, forKey: "ruikeiho")
            saveDate.synchronize()
                    }
        
label3.text = "\(ruikeihour)時間\(ruikeiminute)分あります"
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ModelFiveViewController" {
            
            let fiveViewController = segue.destinationViewController as! FiveViewController
            fiveViewController.useminute=useminute
            fiveViewController.usehour=usehour
            fiveViewController.ruikeiminute=ruikeiminute
            fiveViewController.ruikeihour=ruikeihour
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
