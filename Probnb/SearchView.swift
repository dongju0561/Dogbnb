//
//  SearchView.swift
//  Probnb
//
//  Created by Dongju Park on 2022/08/31.
//

import Foundation
import SwiftUI

struct SearchView: View{
    @State var Hotels = RegisteredHotel()
    init() {
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.886066258, green: 0.886066258, blue: 0.886066258, alpha: 1) //탭바 색깔 변경
    }
    
    var body: some View{
        VStack(){
            ScrollView{
                hotelInformationView(Hotels: $Hotels.hotel1)
                hotelInformationView(Hotels: $Hotels.hotel2)
                hotelInformationView(Hotels: $Hotels.hotel3)
                Spacer()
            }
        }
    }
}

struct hotelInformationView: View{
    @Binding var Hotels: HotelData
    
    var body: some View{
        NavigationLink(destination: HotelInformation(selectedHotel: $Hotels)){
            
            VStack{
                Image(uiImage: Hotels.image[0])
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                    .frame(width: 300, height: 220)
                
                HStack{
                    Text(Hotels.name)
                        .fontWeight(.heavy)
                        .padding(.leading)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Image(systemName: "star.fill").foregroundColor(.gray)
                    Text("\(Hotels.rate, specifier: "%.2f")")
                        .foregroundColor(.gray)
                        .padding(.trailing)
                }
                
                Text(Hotels.location)
                    .padding(.leading)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("₩ \(Hotels.Sprice)/박")
                    .foregroundColor(.black)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
            }
        }
    }
}
struct HotelInformation: View {
    @Binding var selectedHotel : HotelData // 바인딩 사용시에 기본 생성자가 필요하다.
    
    var body: some View{
        let numberOfImage = selectedHotel.image.count
        
        ScrollView{
            LazyVStack{
            // imageGallaryView
            GeometryReader{ proxy in //
                TabView{
                    ForEach(0 ..< numberOfImage){ num in        //0~이미지 배열의 개수만큼 반복
                        Image(uiImage: selectedHotel.image[num])//이미지 출력
                            .resizable()
                            .scaledToFill()
                            .tag(num)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .clipShape(RoundedRectangle(cornerRadius: 5)) //pageTabView의 모서리를 동그랗게 만듬
                .padding()
                .frame(width: proxy.size.width, height: proxy.size.height ) //이미지 크기의 크기 설정
            }.frame(height: 400)
            
            Text(selectedHotel.name)
                .font(.system(size: 25))
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 2)
            Text("⭐️ \(selectedHotel.rate, specifier: "%.2f")")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14))
                .padding(.leading, 20)
                .padding(.top, 2)
            Text("\(selectedHotel.location)")
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            Divider()
                .frame(width: 370, alignment: .center)
            
            if(selectedHotel.famous == true){
                HStack{
                    Text("흔치 않은 기회입니다. \(selectedHotel.owner)님의 에어비엔비 숙소는 코통 예약이 가득 차 있습니다.")
                        .font(.system(size: 14))
                        .padding(.horizontal, 20)
                    Text("💎")
                        .font(.system(size: 40))
                        .padding(.trailing, 20)
                }
                Divider()
                    .frame(width: 370, alignment: .center)
            }
            Spacer()
            }
        }
        Divider()
        HStack{  // 가격 예약 버튼
            VStack{
                HStack{
                    Text("￦\(selectedHotel.Sprice) ")// 선택한 호텔의 가격 출력
                        .fontWeight(.heavy)
                        .font(.system(size: 17))
                        .padding(.leading, 20)
                    Text("/박")
                        .font(.system(size: 16))
                }
                Spacer()
                    .frame(width: 100, height: 20)
                }
                Spacer()
                NavigationLink(destination: SearchView()){
                    Text("예약하기")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .toolbar{
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                            HStack{
                                Button(action: {print("hello")}){
                                    Image(systemName: "heart.fill")
                                    
                                        .foregroundColor(.black)
                                }
                                Button(action: {print("hello")}){
                                    Image(systemName: "heart")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
                .frame(width: 150, height: 55)
                .background(.pink)
                .cornerRadius(10)
                .padding(.trailing, 20)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
      SearchView()
    }
}
