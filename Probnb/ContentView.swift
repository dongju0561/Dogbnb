//
//  ContentView.swift
//  ProbnbTest
//
//  Created by Dongju Park on 2022/08/30.
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
                                HStack{
                                    Text(Hotels.hotel1.name)
                                        .padding(.leading)
                                        .font(.system(size: 15))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                    Image(systemName: "star.fill").foregroundColor(.gray)
                                    Text("\(Hotels.hotel1.score, specifier: "%.2f")")
                                        .foregroundColor(.gray)
                                        .padding(.trailing)
                                }
                                
                                Text(Hotels.hotel1.location)
                                    .padding(.leading)
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("₩ \(Hotels.hotel1.Sprice)/박")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                            }
                                
                                
                                
                        }
                        NavigationLink(destination: HotelInformation()){
                            VStack{
                                Image(uiImage: Hotels.hotel2.image[0])
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(30)
                                    .frame(width: 300, height: 220)
                                HStack{
                                    Text(Hotels.hotel2.name)
                                        .padding(.leading)
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                    Image(systemName: "star.fill").foregroundColor(.gray)
                                    Text("\(Hotels.hotel2.score, specifier: "%.2f")")
                                        .foregroundColor(.gray)
                                        .padding(.trailing)
                                }
                                Text(Hotels.hotel2.location)
                                    .padding(.leading)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("₩ \(Hotels.hotel2.Sprice)/박")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                            }
                                
                        }
                        NavigationLink(destination: HotelInformation()){
                            VStack{
                                Image(uiImage: Hotels.hotel3.image[0])
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(30)
                                    .frame(width: 300, height: 220)
                                HStack{
                                    Text(Hotels.hotel3.name)
                                        .padding(.leading)
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                    Image(systemName: "star.fill").foregroundColor(.gray)
                                    Text("\(Hotels.hotel3.score, specifier: "%.2f")")
                                        .foregroundColor(.gray)
                                        .padding(.trailing)
                                }
                                Text(Hotels.hotel3.location)
                                    .padding(.leading)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("₩ \(Hotels.hotel3.Sprice)/박")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                
                            }
                        }
                        Spacer()
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
                    ProfileTab()
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
