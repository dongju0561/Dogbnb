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
    public var rate: Double
    public var owner: String
    public var famous: Bool
    
    
    var Sprice: String{ //저장된 호텔 정보에서 정수형태의 가격 데이터를 가져와 3자리씩 잘라 콤마를 붙여 문자열로 변환하는 계산 프로퍼티
        get{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            return numberFormatter.string(from: NSNumber(value: price))!
        }
    }
}

struct RegisteredHotel{ //저장된 호텔의 정보들
     var hotel1 = HotelData(name: "THE SHILLA", location: "249, Dongho-ro, Jung-gu, Seoul, Republic of Korea"
                            , image: [#imageLiteral(resourceName: "닥스훈트1"), #imageLiteral(resourceName: "닥스훈트3"), #imageLiteral(resourceName: "닥스훈트2")], price: 134000, rate: 4.97, owner: "Dongju", famous: true)
    var hotel2 = HotelData(name: "HYATT", location: " 322 Sowol-ro, Yongsan-gu, Seoul, Republic of Korea"
                        , image: [#imageLiteral(resourceName: "dog1"), #imageLiteral(resourceName: "닥스훈트3"), #imageLiteral(resourceName: "닥스훈트2")], price: 114259, rate: 4.35, owner: "Yunsu", famous: true)
    var hotel3 = HotelData(name: "LOTTE HOTEL", location: "30, Eulji-ro, Jung-gu, Seoul, Republic of Korea"
                        , image: [#imageLiteral(resourceName: "dog3"), #imageLiteral(resourceName: "닥스훈트3"), #imageLiteral(resourceName: "닥스훈트2")], price: 328104, rate: 3.57, owner: "Puroom", famous: false)
    
}
