//
//  AllRegisteredListContentView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/18.
//

import SwiftUI

struct MainView: View {
    @State var selectedLoanIndex: Int = 0
    @State var isAddLoanButton: Bool = false
    @State var isScanButton: Bool = false
    @State var isPressedAccount: Bool = false
    @State var accountName: String = "アカウント名"
    @State var totalLendingMoney: Int = 58000
    @State var totalBorrowingMoney: Int = 20000

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

    init(){
        //List全体の背景色の設定
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        let displayBounds = UIScreen.main.bounds
        let displaywidth = displayBounds.width
        let displayheight = displayBounds.height
        let qrSystemImageName = "qrcode.viewfinder"
        let addLoanSystemImageName = "note.text.badge.plus"
        let accountButtonSystemImageName = "chevron.down"
        let yenMarkCustomFont = "Futura"
        let loanTotalMoneyCustomFont = "Futura-Bold"

        NavigationView{
            ZStack {

                // 背景を黒にする
                Color.init(red: 0, green: 0, blue: 0)
                    .ignoresSafeArea()

                // MARK: モーダルより上の部分
                VStack {

                    VStack {
                        // アカウント名、貸し金追加、コードスキャン
                        HStack {
                            Button(action: {
                                isPressedAccount.toggle()
                                print("tap buton")
                            }) {
                                HStack {
                                    Text("アカウント名")
                                        .font(.callout)
                                        .foregroundColor(Color(UIColor.white))
                                    Image(systemName: accountButtonSystemImageName)
                                        .foregroundColor(Color(UIColor.gray))
                                }
                            }
                            .padding()

                            Spacer()

                            NavigationLink(destination: RegisterLendInfoView()) {
                                Image(systemName: addLoanSystemImageName)
                            }
                            .padding()
                            .accentColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color.white, radius: 10, x: 0, y: 3)

                            NavigationLink(destination: ScanView()) {
                                Image(systemName: qrSystemImageName)
                            }
                            .padding()
                            .accentColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color.white, radius: 10, x: 0, y: 3)
                            .padding()
                        }

                        Spacer()

                        // 中央の¥表示
                        HStack {
                            Text("¥")
                                .font(.custom(yenMarkCustomFont, size: 20))
                                .foregroundColor(Color(UIColor.gray))

                            if selectedLoanIndex == 0 {
                                Text(String.localizedStringWithFormat("%d", totalLendingMoney))
                                    .font(.custom(loanTotalMoneyCustomFont, size: 30))
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color(UIColor.white))
                                    .font(.title)
                                    .bold()
                            } else {
                                Text(String.localizedStringWithFormat("%d", totalBorrowingMoney))
                                    .font(.custom(loanTotalMoneyCustomFont, size: 30))
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color(UIColor.white))
                                    .font(.title)
                            }
                        }

                        HStack {
                            Spacer(minLength: displaywidth/2)

                            if selectedLoanIndex == 0 {
                                Text("借りた総額")
                                    .foregroundColor(Color(UIColor.gray))
                            } else {
                                Text("貸した総額")
                                    .foregroundColor(Color(UIColor.gray))
                            }

                            Spacer()
                        }
                        Spacer()

                    }

                    // 黒い部分の高さ。3分の11くらいが一番良さそうだった。（感覚）
                    .frame(height: 3*displayheight/11)

                    Spacer()

                    // MARK: モーダル部分
                    ZStack{

                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
                            .shadow(color: .gray, radius: 3, x: 0, y: -1)
                            .ignoresSafeArea()

                        VStack {
                            Picker("", selection: self.$selectedLoanIndex) {
                                Text("借り")
                                    .tag(0)
                                Text("貸し")
                                    .tag(1)
                            }
                            .padding([.top, .leading, .trailing], 40.0)
                            .pickerStyle(SegmentedPickerStyle())

                            if selectedLoanIndex == 0 {
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
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

