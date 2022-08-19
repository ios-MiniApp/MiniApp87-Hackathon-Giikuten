//
//  AllRegisteredListContentView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/18.
//

import SwiftUI

struct MainContentView: View {

    init(){
        //List全体の背景色の設定
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack {
            MainTopView()
                .frame(height: 200)
            Spacer()
            MainBottomView()
        }

    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}

