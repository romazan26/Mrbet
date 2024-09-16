//
//  extensionText.swift
//  Mrbet
//
//  Created by Роман on 16.09.2024.
//

import SwiftUI

extension Text {
    func LondrinaBlack(_ size: CGFloat) -> Text{
        self.font(.custom("LondrinaSolid-Black", size: size))
    }
    func LondrinaLight(_ size: CGFloat) -> Text{
        self.font(.custom("LondrinaSolid-Light", size: size))
    }
    func LondrinaRegular(_ size: CGFloat) -> Text{
        self.font(.custom("LondrinaSolid-Regular", size: size))
    }
    func LondrinaThin(_ size: CGFloat) -> Text{
        self.font(.custom("LondrinaSolid-Thin", size: size))
    }
}
