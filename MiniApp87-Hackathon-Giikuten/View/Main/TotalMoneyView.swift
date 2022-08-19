//
//  TotalMoneyView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/18.
//

import SwiftUI

struct TotalMoneyView: View {
    var body: some View {
        ZStack{
            Color(UIColor.systemCyan)
                .ignoresSafeArea()

            VStack(spacing: 30.0) {
                HStack{
                    Text("アカウント名 ？")
                        .padding()
                    Spacer()

                    Text("通知")
                    Text("2")
                        .foregroundColor(Color.red)
                        .offset(x: -12, y: -8)
                    Text("設定")
                        .padding()
                }

                Text("¥58,034")
                    .font(.title)

                Spacer()
            }
            .frame(height: nil)
        }
    }

}

struct TotalMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        TotalMoneyView()
            .previewLayout(.fixed(width: 400.0, height: 200.0))
    }
}
