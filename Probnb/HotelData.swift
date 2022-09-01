//
//  HotelData.swift
//  ProbnbTest
//
//  Created by Dongju Park on 2022/08/30.
//

import Foundation
import UIKit

struct HotelData {
    public var name: String
    public var location: String
    public var image: [UIImage]
    public var price: Int
    public var score: Double
    
    var Sprice: String{
        get{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            return numberFormatter.string(from: NSNumber(value: price))!
        }
    }
}

struct RegisteredHotel{
     var hotel1 = HotelData(name: "THE SHILLA", location: "249, Dongho-ro, Jung-gu, Seoul, Republic of Korea"
                            , image: [#imageLiteral(resourceName: "닥스훈트1"), #imageLiteral(resourceName: "닥스훈트3"), #imageLiteral(resourceName: "닥스훈트2")], price: 134000, score: 4.97)
    var hotel2 = HotelData(name: "HYATT", location: " 322 Sowol-ro, Yongsan-gu, Seoul, Republic of Korea"
                        , image: [#imageLiteral(resourceName: "dog1"), #imageLiteral(resourceName: "닥스훈트3"), #imageLiteral(resourceName: "닥스훈트2")], price: 114259, score: 4.35)
    var hotel3 = HotelData(name: "LOTTE HOTEL", location: "30, Eulji-ro, Jung-gu, Seoul, Republic of Korea"
                        , image: [#imageLiteral(resourceName: "dog3"), #imageLiteral(resourceName: "닥스훈트3"), #imageLiteral(resourceName: "닥스훈트2")], price: 328104, score: 3.57)
    
}
