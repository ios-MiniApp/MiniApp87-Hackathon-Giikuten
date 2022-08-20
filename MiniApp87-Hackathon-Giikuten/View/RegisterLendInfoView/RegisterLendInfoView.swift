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
                TextField("タイトル", value: $title, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()
                DatePicker("日時を選択", selection: $endTime, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()

                NavigationLink(destination: ConfirmLendInfoView()) {
                    Text("確認").font(.callout)
                }

            }
    }
}

struct RegisterLendInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLendInfoView()
    }
}
