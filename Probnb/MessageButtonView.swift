//
//  MessageButtonView.swift
//  Probnb
//
//  Created by 윤수 on 2022/09/09.
//

import SwiftUI

struct MessageButtonView: View {
  var body: some View {
    List(data){ i in
            NavigationLink(destination: EmptyView()) {
              cellView(data: i)
            }
            .listRowSeparator(.hidden, edges: .top)
    }//List
    .listStyle(.plain)
    .refreshable {
    }
  }
}

// MARK: - View

struct MessageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MessageButtonView()
    }
}


struct cellView: View {
  var data: Message
  var body: some View {

    HStack(spacing: 12) {
      Image(data.image)
        .resizable()
        .frame(width: 55, height: 55)

    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 10) {
        Text(data.id)
        Text(data.location)
      }
      Text(data.lastMessage)

      HStack(spacing: 10) {
        Text(data.travelState)
        Text(data.period)
        }
      }
    }

  }//someView
}


struct Message : Identifiable {

  var image: String
  var id: String
  var location: String
  var lastMessage: String
  var travelState: String
  var period: String
}

  var data = [
    Message(image: "dog", id: "Bara", location: "Seoul", lastMessage: "OK i see", travelState: "여행 종료", period: "2017년 7월 22일~23일"),
    Message(image: "dog", id: "haru", location: "Sokcho", lastMessage: "see U later~", travelState: "여행 종료", period: "2017년 7월 25일~27일"),
    Message(image: "dog", id: "Bara", location: "Seoul", lastMessage: "OK i see", travelState: "여행 종료", period: "2017년 7월 22일~23일")
   ]
