//
//  SearchView.swift
//  Probnb
//
//  Created by Dongju Park on 2022/08/31.
//

import Foundation
import SwiftUI


struct SearchView: View{
    @State var isSelected: Bool = false
    @State var Hotels = RegisteredHotel.self()
    init() {
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.886066258, green: 0.886066258, blue: 0.886066258, alpha: 1) //탭바 색깔 변경
    }
    
    var body: some View{
        VStack(){
            Spacer()
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    ForEach(0..<15){
                        Circle()
                            .fill(Color.pink)
                            .frame(width: 40)
                            .overlay(
                                Text("\($0)")
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
                .frame(height: 60)
                .background( Color(#colorLiteral(red: 0.886066258, green: 0.886066258, blue: 0.886066258, alpha: 1)))
            ScrollView{
                NavigationLink(destination: HotelInformation(selectedHotel: $Hotels.hotel1)){
                    
                    VStack{
                        Image(uiImage: Hotels.hotel1.image[0])
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .frame(width: 300, height: 220)
                        

                        
                        HStack{
                            Text(Hotels.hotel1.name)
                                .fontWeight(.heavy)
                                .padding(.leading)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            Image(systemName: "star.fill").foregroundColor(.gray)
                            Text("\(Hotels.hotel1.rate, specifier: "%.2f")")
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                        
                        Text(Hotels.hotel1.location)
                            .padding(.leading)
                            .font(.system(size: 15))
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
                NavigationLink(destination: HotelInformation(selectedHotel: $Hotels.hotel2)){
                    VStack{
                        Image(uiImage: Hotels.hotel2.image[0])
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .frame(width: 300, height: 220)
                        HStack{
                            Text(Hotels.hotel2.name)
                                .fontWeight(.heavy)
                                .padding(.leading)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            Image(systemName: "star.fill").foregroundColor(.gray)
                            Text("\(Hotels.hotel2.rate, specifier: "%.2f")")
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
                NavigationLink(destination: HotelInformation(selectedHotel: $Hotels.hotel3)){
                    VStack{
                        Image(uiImage: Hotels.hotel3.image[0])
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .frame(width: 300, height: 220)
                        HStack{
                            Text(Hotels.hotel3.name)
                                .fontWeight(.heavy)
                                .padding(.leading)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            Image(systemName: "star.fill").foregroundColor(.gray)
                            Text("\(Hotels.hotel3.rate, specifier: "%.2f")")
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
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
      SearchView()
    }
}
