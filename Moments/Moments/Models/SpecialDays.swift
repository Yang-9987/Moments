//
//  SpecialDays.swift
//  Moments
//
//  Created by 杨健琦 on 4/3/22.
//

import Foundation

struct SpecialDays: Codable, Identifiable {
    var id: UUID
    var title: String
    var time: Date
    var kind: Kind
    var theme: ColorTheme
    
    init(id: UUID = UUID(), title: String, time: Date, kind: Kind, theme: ColorTheme) {
        self.id = id
        self.title = title
        self.time = time
        self.kind = kind
        self.theme = theme
    }
    
    struct Data {
        var title: String = "Something?"
        var time: Date = Date()
        var kind: Kind = .Love
        var theme: ColorTheme = .C99
    }
    
    var data: Data {
        Data(title: title, time: time, kind: kind, theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        time = data.time
        kind = data.kind
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        time = data.time
        kind = data.kind
        theme = data.theme
    }
}

extension SpecialDays {
    static let sampleData: [SpecialDays] =
    [
        SpecialDays(title: "The Best Day", time: string2data(strDate: "2021-09-09"), kind: .Love, theme: .C99),
        SpecialDays(title: "The First Kiss", time: string2data(strDate: "2021-09-08"), kind: .Love, theme: .C98),
        SpecialDays(title: "Together Paint", time: string2data(strDate: "2022-03-28"), kind: .Love, theme: .C97),
    ]
}
