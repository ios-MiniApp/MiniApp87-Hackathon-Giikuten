//
//  ConfirmLendInfoView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/20.
//

import SwiftUI

struct ConfirmLendInfoView: View {
    var body: some View {
        NavigationLink(destination: QRLendInfoView()) {
            Text("OK").font(.callout)
        }
    }
}

struct ConfirmLendInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmLendInfoView()
    }
}
