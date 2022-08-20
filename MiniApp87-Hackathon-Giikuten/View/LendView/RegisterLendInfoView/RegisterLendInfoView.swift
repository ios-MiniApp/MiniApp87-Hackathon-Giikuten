//
//  SwiftUIView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/20.
//

import SwiftUI

struct RegisterLendInfoView: View {
    @State var title: String = ""
    @State var money: String = ""
    @State var endTime: Date = Date()

    var body: some View {
        VStack {
            Spacer().frame(height: 100)

            TextField("タイトル", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            //                TextField("タイトル", value: $money, formatter: NumberFormatter())
            //                    .textFieldStyle(RoundedBorderTextFieldStyle())
            //                    .keyboardType(.numberPad)
            //                    .padding()
            TextField("金額", text: $money)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            DatePicker("日時を選択", selection: $endTime, displayedComponents: .date)
                .datePickerStyle(.compact)
                .labelsHidden()
                .padding()

            NavigationLink(destination: ConfirmLendInfoView(title: $title, money: $money, endTime: $endTime)) {
                Text("確認").font(.callout)
            }.padding()

        }
    }
}

struct RegisterLendInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLendInfoView()
    }
}
