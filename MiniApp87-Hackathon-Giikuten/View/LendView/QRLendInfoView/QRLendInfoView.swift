//
//  QRLendInfoView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/20.
//

import SwiftUI

struct QRLendInfoView: View {
    var body: some View {
        Text("QRの表示")
            .font(.title)
            .padding()
        Text("通信が終わったら、")
            .font(.title)
        Text("自動で画面帰らせたい")
            .font(.title)
    }
}

struct QRLendInfoView_Previews: PreviewProvider {
    static var previews: some View {
        QRLendInfoView()
    }
}
