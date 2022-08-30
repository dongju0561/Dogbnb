//
//  ContentView.swift
//  ProbnbTest
//
//  Created by Dongju Park on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
                TabView {
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("검색")
                        }.tag(1)
                    
                    Text("Tab Content 2")
                        .tabItem {
                            Image(systemName: "heart")
                            Text("위시리스트")
                        }.tag(2)
                    
                    Text("Tab Content 2")
                        .tabItem {
                            Image(systemName: "airplane.departure")
                            Text("여행")
                        }.tag(3)
                    
                    Text("Tab Content 2")
                        .tabItem {
                            Image(systemName: "message")
                            Text("메시지")

                        }.tag(4)
                    
                    ProfileTab()
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

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
