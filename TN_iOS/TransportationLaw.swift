//
//  TransportationLaw.swift
//  TN_iOS
//
//  Created by Hoang Phuc on 7/14/17.
//  Copyright © 2017 Hoang Phuc. All rights reserved.
//

import Foundation

class TransportationLaw{
    var id:Int32
    var article:String
    var title:String
    var content:String
    var fine:String
    var type:String
    
    init(id:Int32,article:String, title:String, content:String, fine:String, type:String){
        self.id = id
        self.article = article
        self.title = title
        self.content = content
        self.fine = fine
        self.type = type
    }
    
    func getArticle() -> String {
        return article
    }
    func getTitle() -> String {
        return title
    }
    func getContent() -> String {
        return content
    }
    func getFine() -> String {
        return fine
    }
    
}
