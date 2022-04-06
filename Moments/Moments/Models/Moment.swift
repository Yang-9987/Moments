//
//  Moment.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import Foundation

struct Moment: Codable, Identifiable {
    var id: UUID
    var dd: Date
    var title: String
    var mood: Mood
    var place: String
    var city: String
    var isFavorite: Bool
    var description: String
    var imageURL: String
    var img: String
    
    init(id: UUID = UUID(), dd: Date, title: String, mood: Mood, place: String, city: String, isFavorite: Bool, description: String, imageURL: String, img:String) {
        self.id = id
        self.dd = dd
        self.title = title
        self.mood = mood
        self.place = place
        self.city = city
        self.isFavorite = isFavorite
        self.description = description
        self.imageURL = imageURL
        self.img = img
    }
    
    struct Data {
        var dd: Date = Date()
        var title: String = ""
        var mood: Mood = .Confused
        var place: String = ""
        var city: String = ""
        var isFavorite: Bool = false
        var description: String = ""
        var imageURL: String = ""
        var img: String = "LaunchImage"
    }
    
    var data: Data {
        Data(dd:dd, title: title, mood: mood, place: place, city: city, isFavorite: isFavorite, description: description, imageURL: imageURL, img: img)
    }
    
    mutating func update(from data: Data) {
        dd = data.dd
        title = data.title
        mood = data.mood
        place = data.place
        city = data.city
        isFavorite = data.isFavorite
        description = data.description
        imageURL = data.imageURL
        img = data.img
    }
    
    init(data: Data) {
        id = UUID()
        dd = data.dd
        title = data.title
        mood = data.mood
        place = data.place
        city = data.city
        isFavorite = data.isFavorite
        description = data.description
        imageURL = data.imageURL
        img = data.img
    }
}

extension Moment {
    static let sampleData:[Moment] =
    [
        Moment(dd: string2data(strDate: "2022-01-04"), title: "First Skiing", mood: .Happy, place: "Nanshan", city: "Beijing", isFavorite: true, description: "非常开心", imageURL: "", img: "Snow_1"),
        Moment(dd: string2data(strDate: "2021-12-31"), title: "New Year", mood: .Confused, place: "Sanlitun", city: "Beijing", isFavorite: false, description: "惊喜且意外", imageURL: "", img: "NewYear_1"),
        Moment(dd: string2data(strDate: "2022-02-14"), title: "2022情人节", mood: .Happy, place: "黔灵山", city: "GuiYang", isFavorite: true, description: "爬山开心嘿嘿嘿", imageURL: "", img: "Val_mountain"),
        Moment(dd: string2data(strDate: "2021-09-07"), title: "Universal Studio", mood: .Surprised, place: "环球影城", city: "Beijing", isFavorite: true, description: "耶耶耶耶耶耶耶耶耶", imageURL: "", img: "Universal_1"),
        Moment(dd: string2data(strDate: "2022-02-13"), title: "去见我的宝贝啦", mood: .Happy, place: "Wanda", city: "GuiYang", isFavorite: false, description: "时隔30天终于见面啦", imageURL: "", img: "Val_1"),
        Moment(dd: string2data(strDate: "2021-12-25"), title: "考研加油", mood: .Nervous, place: "民大", city: "Beijing", isFavorite: false, description: "紧张虽迟但到", imageURL: "", img: "Kaoyan_1")
    ]
}

