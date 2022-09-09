//
//  MessageTab.swift
//  Probnb
//
//  Created by 윤수 on 2022/09/09.
//

import SwiftUI

struct MessageTab: View {
  @State var currentTab: Int = 0

    var body: some View {
      NavigationView {
        VStack {
          TabBarView(currentTab: self.$currentTab)

          TabView(selection: self.$currentTab) {
            MessageButtonView().tag(0)
            MessageAlertView().tag(1)
          }


        }
        .navigationTitle("메시지함")

      }//NavigationView
    }
}

struct TabBarView: View {
  @Binding var currentTab: Int
  @Namespace var namespace

  var tabBarOptions: [String] = ["메시지", "알림"]
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 20) {
        ForEach(Array(zip(self.tabBarOptions.indices,
                  self.tabBarOptions)),
            id: \.0,
            content: {
          index, name in
          TabBarItem(currentTab: self.$currentTab,
                 namespace: namespace.self,
                 tabBarItemName: name,
                 tab: index)

        })
      }
      .padding(.horizontal)
    }
    .background(Color.white)
    .frame(height: 80)
  }
}

struct TabBarItem: View {
  @Binding var currentTab: Int
  let namespace: Namespace.ID

  var tabBarItemName: String
  var tab: Int

  var body: some View {

      Button {
        self.currentTab = tab
      } label: {
        VStack {
          Spacer()
          Text(tabBarItemName)
          if currentTab == tab {
            Color.black
              .frame(height: 2)
              .matchedGeometryEffect(id: "underline",
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



struct MessageTab_Previews: PreviewProvider {
    static var previews: some View {
        MessageTab()
    }
}
