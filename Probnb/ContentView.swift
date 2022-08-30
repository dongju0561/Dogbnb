//
//  ContentView.swift
//  Probnb
//
//  Created by Dongju Park on 2022/08/29.
//

import SwiftUI

struct ContentView: View {
    var Hotels = RegisteredHotel()
    var body: some View {
        NavigationView{
            VStack(spacing: 5){

                ScrollView(.horizontal){
                    HStack(spacing: 10){
                        ForEach(0..<15){
                            Circle()
                                .fill(Color.black)
                                .frame(width: 40)
                                .overlay(
                                    Text("\($0)")
                                        .foregroundColor(.white)
                                )
                        }
                    }
                }
                    .frame(height: 60)
                    .background(.gray)
                
                TabView {
                    ScrollView{

                        NavigationLink(destination: HotelInformation()){
                            VStack{
                                Image(uiImage: Hotels.hotel1.image[0])
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(30)
                                    .frame(width: 300, height: 220)
                                Text(Hotels.hotel1.location)
                                    .padding(.leading)
                                    .font(.system(size: 25))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(Hotels.hotel1.name)
                                    .padding(.leading)
                                    .font(.system(size: 25))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                                
                                
                                
                        }
                        NavigationLink(destination: HotelInformation()){
                            VStack{
                                Image("dog2")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(30)
                                    .frame(width: 300, height: 220)
                                Text("so cute")
                                    .padding(.leading)
                                    .font(.system(size: 25))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                                
                        }
                        NavigationLink(destination: HotelInformation()){
                            VStack{
                                Image("dog3")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(30)
                                    .frame(width: 300, height: 220)
                                Text("so cute")
                                    .padding(.leading)
                                    .font(.system(size: 25))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
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
                    Text("Tab Content 2")
                        .tabItem {
                            Image(systemName: "person")
                            Text("프로필")

                        }.tag(5)
                }
            }
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
