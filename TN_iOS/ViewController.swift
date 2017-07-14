//
//  ViewController.swift
//  TN_iOS
//
//  Created by Hoang Phuc on 7/13/17.
//  Copyright © 2017 Hoang Phuc. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // File location
        let fileURLProject = NSBundle.mainBundle().pathForResource("luattext", ofType: "txt")
        // Read from the file
        
        do {
            let data = try NSString(contentsOfFile: fileURLProject!, encoding: NSUTF8StringEncoding)
            // Duyệt nội dung của file
            data.enumerateLinesUsingBlock({(line, stop) -> () in
                var e:String = line
                var sArr = e.componentsSeparatedByString("\\")
                var text:String = sArr[0]
                
                print("Nội dung tập tin: \(text)")
            })
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURLProject), Error: " + error.localizedDescription)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Thiết lập số dòng được hiển thị
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // Hiển thị dữ liệu lên Table View
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Tham chiếu cell được thiết kế tại Prototype Cells
        let cell = self.tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! CusTableViewCell
        
        // Hiển thị dữ liệu
        //cell.lblName.text = self.names[indexPath.row]
        //cell.lblAge.text = String.init(self.ages[indexPath.row])
        
        return cell;
    }

}

