//
//  AccommodationType.swift
//  Probnb
//
//  Created by Dongju Park on 2022/09/09.
//

import Foundation
import SwiftUI

struct AccommodationTypeTab: View {
    @State var currentTab: Int = 0
    @State var isZoomed = false
    @Namespace var animation
    
    var height: CGFloat{ //isZoomed 변수에 따라 직사각형 크기 조절
        isZoomed ? 300 : 50
    }
    var width: CGFloat{
        isZoomed ? 370 : 350
    }
    var body: some View{
        VStack{
            Spacer()
            SearchTravelPlaceView(isZoomed: $isZoomed, width: width, height: height)
            Spacer()
            AccommodationTabBarView(currentTab: self.$currentTab)
                .padding(.horizontal, 20)
                .frame(height: 50)
            Divider()
            TabView(selection: self.$currentTab){
                SearchView().tag(0)
                Text("hello").tag(1)
                Text("hi").tag(2)
                Text("bye").tag(3)
                Text("niceMeetYou").tag(4)
            }
            .tabViewStyle(.page(indexDisplayMode: .never)) // 하단 transition을 위한 tabBar 대신 다른 indigator "indexDisplayMode: .never"는 그것조차 삭제
        }
    }
}
//여행 목적지 설정을 위한 필터의 뷰
struct SearchTravelPlaceView: View{
    @Binding var isZoomed: Bool
    let width: CGFloat
    let height: CGFloat
    var body: some View{
        ZStack{
            Rectangle()
                .fill(.white)
                .cornerRadius(30)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                .frame(width: width, height: height, alignment: .center)
                .onTapGesture {
                    withAnimation(.spring()){
                        isZoomed.toggle()
                    }
                }
            if isZoomed == true{
                OpenedSearchTravelPlaceView()
            }
            else {
                ClosedSearchTravelPlaceView()
            }
        }
    }
}

//여행 목적지 설정을 위한 필터의 view가 축소되었을때
struct ClosedSearchTravelPlaceView: View{
    var body: some View{
        HStack{
            Image(systemName: "magnifyingglass")
            VStack{
                Text("어디로 여행가세요?")
                    .font(.system(size: 11))
                    .frame(width: 220, alignment: .leading)
                Text("어디든지 . 언제든 일주일 . 게스트 추가")
                    .font(.system(size: 11))
                    .frame(width: 220, alignment: .leading)
                    .foregroundColor(.gray)
                
            }
            .padding(.horizontal, 10)
            Button{
                print("hello")
            }
            label: {
                ZStack{
                    Circle()
                        .fill(.gray)
                        .frame(width: 35, height: 35)
                    Text("edit")
                        .foregroundColor(.black)
                        .font(.system(size: 10))
                }
            }
            //modal transition
        }
    }
}

//여행 목적지 설정을 위한 필터의 view가 확장하였을때
struct OpenedSearchTravelPlaceView: View{
    var body: some View{
        VStack(spacing: 15){
            Text("여행지를 알려주세요")
                .fontWeight(.heavy)
                .font(.system(size: 20))
                .frame(width: 300, alignment: .leading)
            Button{}
            label:{
                ZStack{
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(8)
                        .frame(width: 300, height: 40, alignment: .center)
                        .padding(1)
                        .background(.gray)
                        .cornerRadius(8)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                            .font(.system(size: 15))
                        Text("유연한 검색")
                            .foregroundColor(.black)
                            .font(.system(size: 13))
                    }
                    .frame(width: 280, alignment: .leading)
                }
            }
            ScrollView(.horizontal){
                HStack{
                    ForEach(1..<20){
                       item in
                        VStack(spacing: 3){
                            Image(systemName: "magnifyingglass")
                                .frame(width: 100, height: 100)
                                .background(.green)
                                .cornerRadius(5)
                            Text("hello")
                                .frame(width: 100, alignment: .leading)
                                .padding(.leading, 5)
                        }
                            
                    }
                }
            }
            .frame(width: 300, height: 120 )
            
        }
    }
}

struct AccommodationTabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["호텔", "A자형 주택", "북국", "멋진 수영장", "통나무집"]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)),
                        id: \.0,
                        content: {
                    index, name in
                    AccommodationTabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index)
                })
            }
        }
    }
}

// 숙소 유형 선택을 위한 탭바의 item
struct AccommodationTabBarItem: View {
  @Binding var currentTab: Int
  let namespace: Namespace.ID
  var tabBarItemName: String
  var tab: Int

  var body: some View {

      Button {
        self.currentTab = tab // 선택한 버튼의 인덱스 번호를 currnetTab에 입력
      } label: {
        VStack {
          Spacer()
          Text(tabBarItemName)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .padding(.horizontal, 10)
          if currentTab == tab { // 선택한 탭의 설정
            Color.black
              .frame(height: 2) // 선택한 탭이 살짝 떠 보이게: 텍스트 상자의 높이를 6으로 조정
              .matchedGeometryEffect(id: "underline", //서로 다른 view계층의 동일한 view가 자연습럽게 애니메이션
                           in: namespace,
                           properties: .frame)
          } else {
            Color.clear.frame(height: 2)

          }
        }
        .animation(.spring(), value: self.currentTab)
      }
    .buttonStyle(.plain)
  }
}
//
//struct type_preview: PreviewProvider {
//    static var previews: some View{
//        AccommodationType()
//    }
//}
