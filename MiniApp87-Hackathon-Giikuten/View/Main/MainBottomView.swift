//
//  ModalStyleSquareListView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/19.
//

import SwiftUI

struct MainBottomView: View {
    @State var selectedIndex = 0
    @State var isAddButton = false

    var lendPersons = [
        Person.init(title: "お好み焼", name: "有村架純", money: 5000, stateDate: Date(), endDate: Date()),
        Person.init(title: "お好み焼", name: "広瀬すず", money: 2500, stateDate: Date(), endDate: Date()),
        Person.init(title: "お好み焼", name: "浜辺美波", money: 50000, stateDate: Date(), endDate: Date()),
        Person.init(title: "お好み焼", name: "新垣結衣", money: 300, stateDate: Date(), endDate: Date())
    ]

    var borrowPersons = [
        Person.init(title: "お好み焼", name: "新田真剣佑", money: 12300, stateDate: Date(), endDate: Date()),
        Person.init(title: "お好み焼", name: "小栗旬", money: 1000, stateDate: Date(), endDate: Date()),
        Person.init(title: "お好み焼", name: "松坂桃李", money: 2000, stateDate: Date(), endDate: Date()),
    ]

    var body: some View {
        ZStack{
            RoundedRectangle(cornerSize: .init(width: 30, height: 30))
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.mint, .white]),
                        startPoint: .center,
                        endPoint: .bottom
                    )
                )
                .padding()
                .ignoresSafeArea()

            VStack {
                Picker("", selection: self.$selectedIndex) {
                    Text("借り")
                        .tag(0)
                    Text("貸し")
                        .tag(1)
                }
                .padding([.top, .leading, .trailing], 40.0)
                .pickerStyle(SegmentedPickerStyle())

                if selectedIndex == 0 {
                    List{
                        Section {
                            ForEach(0 ..< lendPersons.count,  id: \.self) { index in
                                LoanListView(title: lendPersons[index].title, person: lendPersons[index].name, money: lendPersons[index].money)
                                    .frame(height: 70)
                                    .listRowBackground(Color.clear)
                            }
                        }
                    }
                    .padding()
                    .offset(x: -10, y: -20)
                    .ignoresSafeArea()
                } else {
                    List{
                        Section {
                            ForEach(0 ..< borrowPersons.count,  id: \.self) { index in
                                LoanListView(title: borrowPersons[index].title, person: borrowPersons[index].name, money: borrowPersons[index].money)
                                    .frame(height: 70)
                                    .listRowBackground(Color.clear)
                            }
                        }
                    }
                    .padding()
                    .offset(x: -10, y: -20)
                    .ignoresSafeArea()
                }
            }

            VStack{
                Spacer()
                ShadowLandscapeButtonView(
                    isPressed: $isAddButton,
                    displayName: nil,
                    systemImageName: "plus"
                )
            }
        }
    }
}
