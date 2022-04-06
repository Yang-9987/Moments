//
//  FileOperation.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import Foundation

class FileOperation {
    static func removeFile(sourceUrl: String) {
        let fileManager = FileManager.default
        do{
            try fileManager.removeItem(atPath: sourceUrl)
            Dlog("Success remove")
        } catch {
            Dlog("Fail")
        }
    }
    
    static func listFolder(folderUrl:String){
            let manger = FileManager.default
            //        获得文档目录下所有的内容，以及子文件夹下的内容，在控制台打印所有的数组内容
            let contents = manger.enumerator(atPath: folderUrl)
            print("contents:\(String(describing: contents?.allObjects))")
    }
}
