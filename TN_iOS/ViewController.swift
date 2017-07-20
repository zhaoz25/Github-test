//
//  ViewController.swift
//  TN_iOS
//
//  Created by Hoang Phuc on 7/16/17.
//  Copyright © 2017 Hoang Phuc. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate, UISearchBarDelegate {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let sqlite = SqliteHelper()
    var alLaw = [TransportationLaw]()
    var type = ""
    
    var searchActive : Bool = false
    var filtered:[TransportationLaw] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Setup delegates */
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        let ret = self.sqlite.select(type)
        if(ret != nil){
            alLaw = self.sqlite.select(type)!
        }
        
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // chuyen ve khong dau
        let s = searchText.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
        // loc mang alLaw
        filtered = alLaw.filter({ (text) -> Bool in
            let title = text.title.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
            
            let tmp : NSString = title
            let range = tmp.rangeOfString(s, options : NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
            
        })
        if(filtered.count == 0){
            searchActive = true;
        } else {
            searchActive = true;
        }
        if(searchText == ""){
            searchActive = false;
        }
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Thiết lập số dòng được hiển thị
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive == true){
            print("filter \(filtered.count)")
            return filtered.count
        }
        else{
            print("array \(alLaw.count)")
            return alLaw.count
        }
    }
    
    // Hiển thị dữ liệu lên Table View
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Tham chiếu cell được thiết kế tại Prototype Cells
        let cell = self.tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! CusTableViewCell
        
        if(searchActive == true){
            // hien thi du lieu khi search
            cell.titleCell.text = self.filtered[indexPath.row].title
            cell.contentCell.text = self.filtered[indexPath.row].content
            cell.mucphatCell.text = self.filtered[indexPath.row].fine
        }
        else{
            // Hiển thị dữ liệu
            cell.titleCell.text = self.alLaw[indexPath.row].title
            cell.contentCell.text = self.alLaw[indexPath.row].content
            cell.mucphatCell.text = self.alLaw[indexPath.row].fine
        }
        
        return cell;
    }
    /*
    @IBAction func insertLaw(sender: UIButton) {
    // File location
    let fileURLProject = NSBundle.mainBundle().pathForResource("xemay", ofType: "txt")
    // Read from the file
    
    do {
    let data = try NSString(contentsOfFile: fileURLProject!, encoding: NSUTF8StringEncoding)
    // Duyệt nội dung của file
    data.enumerateLinesUsingBlock({(line, stop) -> () in
    let e:String = line
    var sArr = e.componentsSeparatedByString("\\")
    
    let law = TransportationLaw(id : 0, article: sArr[0], title: sArr[1], content: sArr[2], fine: sArr[3], type: "xemay")
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
    @IBAction func selectLaw(sender: UIButton) {
    var alLaw = [TransportationLaw]()
    alLaw = self.sqlite.select()
    var i = 0
    
    while(i<10){
    let s = alLaw[i].title
    let t = s.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
    print(t)
    i++
    }
    }*/

}
