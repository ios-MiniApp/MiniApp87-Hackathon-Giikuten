//
//  TotalMoneyView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/18.
//

import SwiftUI

struct MainTopView: View {
    @State var isPressedAccount = false

    var body: some View {
        ZStack{
            Color(UIColor.systemCyan)
                .ignoresSafeArea()

            VStack(spacing: 30.0) {
                HStack{
                    ShadowLandscapeButtonView(
                        isPressed: $isPressedAccount,
                        displayName: "アカウント名",
                        systemImageName: "chevron.down.circle"
                    )
                    Spacer()
                }

                Text("¥ 58,034")
                    .font(.title)
                    .bold()

                Spacer()
            }
            .frame(height: nil)
        }
    }

}

struct TotalMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        MainTopView()
            .previewLayout(.fixed(width: 400.0, height: 200.0))
    }
}
