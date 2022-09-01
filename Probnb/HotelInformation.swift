//
//  HotelList.swift
//  ProbnbTest
//
//  Created by Dongju Park on 2022/08/30.
//

//객체 정보를 받아와  데이터들을 입력
import SwiftUI

struct HotelInformation: View {
    @Binding var selectedHotel : HotelData // 바인딩 사용시에 기본 생성자가 필요하다.
    init(selectedHotel: Binding<HotelData>){
        _selectedHotel = selectedHotel
    }
    @State var testState: Bool = true
    
    
    var body: some View{
        
        
        VStack{
            Image(uiImage: selectedHotel.image[0]) // 선택한 호텔의 이미지 모음
                .resizable()
                .scaledToFit()
            Spacer()
            
            
            HStack{
                VStack{
                    HStack{
                        Text("￦\(selectedHotel.Sprice) ")
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
                
                
            } // 가격 예약 버튼
        }
        
    }
}
//
//struct HotelInfo_preview: PreviewProvider {
//    static var previews: some View{
//        HotelInformation(selectedHotel: $Hotels.hotel1)
//    }
//}
