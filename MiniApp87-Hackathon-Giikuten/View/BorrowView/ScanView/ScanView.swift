//
//  ScanView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/20.
//

import SwiftUI

struct ScanView: View {
    var body: some View {
        Text("カメラをオンにして、")
            .font(.title)
        Text("Scan画面の実装")
            .font(.title)
        NavigationLink(destination: ConfirmScanInfoView()) {
            Text("仮にスキャンできた").font(.callout)
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
