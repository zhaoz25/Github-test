//
//  SqliteHelper.swift
//  TN_iOS
//
//  Created by Hoang Phuc on 7/14/17.
//  Copyright © 2017 Hoang Phuc. All rights reserved.
//

import Foundation

class SqliteHelper{
    
    var dbPath : String = ""
    
    let TABLE_NAME = "luatgiaothong"
    let ARTICLE_COLUMN = "article"
    let TITLE_COLUMN = "title"
    let CONTENT_COLUMN = "content"
    let FINE_COLUMN = "fine"
    let TYPE_COLUMN = "type"
    
    init(){
        let fm = NSFileManager.defaultManager()
        let dd = fm.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fp = dd.URLByAppendingPathComponent("Luat.db")
        dbPath = fp.path!
        
        if !fm.fileExistsAtPath(dbPath as String) {
            let db = FMDatabase(path: dbPath as String)
            if db == nil {
                print("Lỗi tạo cơ sở dữ liệu: \(db.lastErrorMessage())")
            }
            
            
            if db.open() {
                let sql = "CREATE TABLE \(TABLE_NAME) (id INTEGER PRIMARY KEY autoincrement,\(ARTICLE_COLUMN)  TEXT,\(TITLE_COLUMN) TEXT,\(CONTENT_COLUMN) TEXT, \(FINE_COLUMN) TEXT,\(TYPE_COLUMN) TEXT)"
                if !db.executeStatements(sql) {
                    print("Lỗi tạo bảng: \(db.lastErrorMessage())")
                }
                db.close()
            } else {
                print("Lỗi mở kết nối: \(db.lastErrorMessage())")
            }
            
        }
    }
    
    func insert(law : TransportationLaw)->Bool{
        let db = FMDatabase(path: dbPath as String)
        
        if db.open() {
            
            let sql = "INSERT INTO \(TABLE_NAME) (\(ARTICLE_COLUMN),\(TITLE_COLUMN),\(CONTENT_COLUMN),\(FINE_COLUMN),\(TYPE_COLUMN)) VALUES (?, ?, ?, ?, ?)"
            let ret = db.executeUpdate(sql, withArgumentsInArray: [law.article, law.title, law.content,law.fine,law.type])
            
            if !ret {
                print("Lỗi thêm dữ liệu: \(db.lastErrorMessage())")
                db.close()
                return false
            } else {
                print("Thêm dữ liệu thành công")
                db.close()
                return true
            }
            // Đóng cơ sở dữ liệu
            
        } else {
            print("Lỗi mở cơ sở dữ liệu: \(db.lastErrorMessage())")
            return false
        }
    }
    
    func select(type : String) -> (Array<TransportationLaw>)?{
        let db = FMDatabase(path: dbPath as String)
        db.open()
        
        let sql : String = "SELECT * FROM \(TABLE_NAME) where \(TYPE_COLUMN) = '\(type)'"
        /*
        if( s != ""){
            sql += " and name like '%\(s)%'"
        }*/
        
        let rs: FMResultSet! = db.executeQuery(sql, withArgumentsInArray: nil)
        print(rs.columnCount())
        var alLaw = [TransportationLaw]()
        if (rs != nil) {
            // Duyệt kết quả
            while rs.next() {
                
                // Đọc dữ liệu
                let id : Int32 = rs.intForColumn("id")
                let article : String = rs.stringForColumn(ARTICLE_COLUMN)
                let title : String = rs.stringForColumn(TITLE_COLUMN)
                let content : String = rs.stringForColumn(CONTENT_COLUMN)
                let fine : String = rs.stringForColumn(FINE_COLUMN)
                let type : String = rs.stringForColumn(TYPE_COLUMN)
                
                // Gán giá trị cho các thuộc tính
                let law = TransportationLaw(id: id, article: article, title: title, content: content, fine: fine, type: type)
                
                
                // Thêm empInfo vào mảng
                alLaw.append(law)
                
                
            }
        }
        else{
            // Đóng cơ sở dữ liệu
            db.close()
            return nil
        }
        // Đóng cơ sở dữ liệu
        db.close()
        
        
        return alLaw
    }
    
    func delete() -> Bool {
        let db = FMDatabase(path: dbPath as String)
        
        if db.open() {
            let sql = "delete from \(TABLE_NAME) where \(TYPE_COLUMN) = 'oto'"
            let ret = db.executeUpdate(sql, withArgumentsInArray: nil)
            
            if !ret {
                print("Lỗi xoá dữ liệu: \(db.lastErrorMessage())")
            } else {
                print("Xoá dữ liệu thành công")
                return true
            }
            // Đóng cơ sở dữ liệu
            db.close()
        } else {
            print("Lỗi mở cơ sở dữ liệu: \(db.lastErrorMessage())")
        }
        
        return false
    }
    /*
    func update(nv : NhanVien) -> Bool {
        let db = FMDatabase(path: dbPath as String)
        
        if db.open() {
            let sql = "UPDATE nhanvien SET name = '\(nv.ten)', diachi = '\(nv.diaChi)', sdt = '\(nv.sdt)' WHERE id = \(nv.id)"
            let ret = db.executeUpdate(sql, withArgumentsInArray: nil)
            
            if !ret {
                print("Lỗi cập nhật dữ liệu: \(db.lastErrorMessage())")
            } else {
                print("Cập nhật dữ liệu thành công")
                return true
            }
            // Đóng cơ sở dữ liệu
            db.close()
        } else {
            print("Lỗi mở cơ sở dữ liệu: \(db.lastErrorMessage())")
        }
        
        return false
    }*/
    
}