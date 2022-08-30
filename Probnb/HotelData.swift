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
//    public var Sprice: String = {
//        self.price =
//        return
//    }
}

struct RegisteredHotel {
     var hotel1 = HotelData(name: "신라호텔", location: "서울 몰라"
                            , image: [#imageLiteral(resourceName: "닥스훈트1"), #imageLiteral(resourceName: "닥스훈트3"), #imageLiteral(resourceName: "닥스훈트2")], price: 134000)
    var hotel2 = HotelData(name: "하야트호텔", location: "서울 용산구"
                        , image: [#imageLiteral(resourceName: "닥스훈트1"), #imageLiteral(resourceName: "닥스훈트3"), #imageLiteral(resourceName: "닥스훈트2")], price: 114259)
    var hotel3 = HotelData(name: "롯데호텔", location: "서울 어딘가"
                        , image: [#imageLiteral(resourceName: "닥스훈트1"), #imageLiteral(resourceName: "닥스훈트3"), #imageLiteral(resourceName: "닥스훈트2")], price: 328104)
    
}
