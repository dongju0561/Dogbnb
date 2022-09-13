//
//  ContentView.swift
//  ProbnbTest
//
//  Created by Dongju Park on 2022/08/30.
//

import SwiftUI

//기능들을 나눠놓은 tabView
struct tabView: View {
    var body: some View {
        VStack {
            NavigationView{
                    TabView { //하단의 탭바
                        AccommodationTypeTab()
                            .tabItem {
                                Image(systemName: "magnifyingglass") //첫번째 탭바의 이미지
                                Text("검색")
                            }.tag(1)
                        
                        Text("hello")
                            .tabItem {
                                Image(systemName: "heart")
                                Text("위시리스트")
                            }.tag(2)
                        
                        Text("Tab Content 2")
                            .tabItem {
                                Image(systemName: "airplane.departure")
                                Text("여행")
                            }.tag(3)
                        
                        MessageTab()
                            .tabItem {
                                Image(systemName: "message")
                                Text("메시지")

                            }.tag(4)
                        
                        ProfileTab( forEachSectionBoundary: 0...5)
                            .tabItem {
                                Image(systemName: "person")
                                Text("프로필")
                            }.tag(5)
                    }
                    .accentColor(.pink)
                .hiddenNavigationBarStyle()
            }
        }
    }
}

//navigationView를 형태를 수정
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("hello", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

//navigationView의 수정사항을 함수에 적용
extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        tabView()
            .previewInterfaceOrientation(.portrait)
    }
}
