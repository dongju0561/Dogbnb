//
//  ProfileTab.swift
//  Probnb
//
//  Created by 윤수 on 2022/08/30.
//

import SwiftUI

struct ProfileTab: View {
  let sectionName: [String] = ["계정 관리", "호스팅", "추천 및 여행 크레딧", "도구", "에어비앤비 지원", "법률"]
// 양쪽 사이드 여백: 6.15% x2
// GeometryReader로 Profile frame, Guide Frame, TableView 묶기
  var forEachSectionBoundary : ClosedRange<Int>

    var body: some View {
        NavigationView {
          List {
            ProfileNavigatorView()
              .listRowSeparator(.hidden, edges: .top)
              .padding(.bottom)

            // Banner
            ProfileBannerView()

            // ProfileListView + ForEachSection
            ForEach(forEachSectionBoundary, id: \.self){ itemIndex in
              Section(header: Text("\(sectionName[itemIndex])")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                    .padding(.bottom)

                ) {
                switch itemIndex {
                  case 0: ProfileListView(forEachBoundary: 0...4)
                  case 1: ProfileListView(forEachBoundary: 5...6)
                  case 2: ProfileListView(forEachBoundary: 7...7)
                  case 3: ProfileListView(forEachBoundary: 8...8)
                  case 4: ProfileListView(forEachBoundary: 9...13)
                  case 5: ProfileListView(forEachBoundary: 14...16)
                  default: ProfileListView(forEachBoundary: 0...4)
                    }
                  }
                }
          }//List
          .listStyle(.plain)
          .navigationBarHidden(true)



        }//NavigationView
      }//someView
    }//ProfileTabView

struct ProfileTab_Previews: PreviewProvider {
    static var previews: some View {
      ProfileTab(forEachSectionBoundary: 0...5)
    }
}

// MARK: - View

struct ProfileNavigatorView: View {
  var body: some View {
    VStack(spacing: 15) {
      Image("dog")
        .resizable()
        .frame(width: 55, height: 55)
        .clipShape(Circle())
        .frame(maxWidth: .infinity, alignment: .leading)

      Text("닉네임") // Binding값 받기
        .font(.title)
        .frame(maxWidth: .infinity, alignment: .leading)

      Button {
      } label: {
        Text("프로필보기")
          .foregroundColor(.black)
          .underline()
      }
      .frame(maxWidth: .infinity, alignment: .leading)

    }// profile frame
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding([.top, .bottom], 10)
  }
}

struct ProfileBannerView: View {
  var body: some View {
    HStack {
      Image("EmptySpace")
        .resizable()
        .frame(width: 50, height: 50)
        .padding(.bottom)
      VStack{
        Text("남는 공간을 활용해 수입을 올리세요.")
        Text("자세히 알아보기")
          .underline()
          .font(.system(size: 15))
          .padding(.bottom)
      }
    }
    .listRowSeparator(.hidden, edges: .top)
  }
}

struct ProfileListView: View {
  // https://www.youtube.com/watch?v=Bze0n3fBDJA&t=294s - 정대리 빡코딩 ForEach 참고 영상
  let sectionName: [String] = ["계정 관리", "호스팅", "추천 및 여행 크레딧", "도구", "에어비앤비 지원", "법률"]
  let destinationName = EmptyView()
  let listLogo: [String] = ["person.circle", "tray.circle", "airplane.circle", "bell", "heart", "heart", "heart", "heart", "heart", "heart",
                            "person.circle", "tray.circle", "airplane.circle", "bell", "heart", "heart", "heart"]
  let listName: [String] = ["개인 정보", "결제 및 대금 수령", "번역", "알림", "개인정보 보호 및 공유", "체험 관리", "숙소 등록하기", "호스트 초대하기",
                            "시리 설정", "에어비엔비 이용 방법", "안전센터",
                            "이웃 민원 지원 서비스에 연락하기", "도움말", "피드백 남기기", "이용 약관", "개인정보 처리방침", "회사 세부정보"]
  var forEachBoundary : ClosedRange<Int>

  var body: some View {
    // switch case로 0~4, 5~6, 7, 8, 9~13, 14~16


        ForEach(forEachBoundary, id: \.self){ itemIndex in
          switch itemIndex {
            case 0, 5, 7...9, 14:
              NavigationLink(destination: EmptyView()) {
                Image(systemName: "\(listLogo[itemIndex])")
                Text("\(listName[itemIndex])")
              }
              .listRowSeparator(.hidden, edges: .top)

            default:
              NavigationLink(destination: EmptyView()) {
                Image(systemName: "\(listLogo[itemIndex])")
                Text("\(listName[itemIndex])")
              }
            }
          }
    }
}
