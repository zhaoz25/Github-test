//
//  QuanLyView.swift
//  TN_iOS
//
//  Created by Hoang Phuc on 7/16/17.
//  Copyright © 2017 Hoang Phuc. All rights reserved.
//

import UIKit

class QuanLyView: UIViewController {
    
    let sqlite = SqliteHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func xemayClick(sender: UIButton) {
        print("click")
        let lawVC = self.storyboard?.instantiateViewControllerWithIdentifier("LawView") as! ViewController
        lawVC.type = "xemay"
        self.navigationController?.pushViewController(lawVC, animated: true)

    }

    @IBAction func otoClick(sender: UIButton) {
        let lawVC = self.storyboard?.instantiateViewControllerWithIdentifier("LawView") as! ViewController
        lawVC.type = "oto"
        self.navigationController?.pushViewController(lawVC, animated: true)
    }
    
    @IBAction func insertOto(sender: UIButton) {
        // File location
        let fileURLProject = NSBundle.mainBundle().pathForResource("oto", ofType: "txt")
        // Read from the file
        
        do {
            let data = try NSString(contentsOfFile: fileURLProject!, encoding: NSUTF8StringEncoding)
            // Duyệt nội dung của file
            data.enumerateLinesUsingBlock({(line, stop) -> () in
                let e:String = line
                var sArr = e.componentsSeparatedByString("\\")
                
                let law = TransportationLaw(id : 0, article: sArr[0], title: sArr[1], content: sArr[2], fine: sArr[3], type: "oto")
                self.sqlite.insert(law)
                
                //print("Dieu khoan: \(sArr[0])   ")
                //print("Tieu de: \(sArr[1])   ")
                // print("Noi dung: \(sArr[2])   ")
                //print("Muc phat: \(sArr[3])")
                
            })
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURLProject), Error: " + error.localizedDescription)
        }
    }
    @IBAction func deleteOto(sender: UIButton) {
        sqlite.delete()
    }
    
}
