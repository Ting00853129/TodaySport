//
//  ContentView.swift
//  TodaySport
//
//  Created by Victor Tao on 2022/11/8.
//

import SwiftUI

struct ContentView: View {
    @State private var num : Int = 0
    @State private var showalert = false
    @State private var sportToday = true
    @State private var showalertSleep = false
    @State private var showSport = false
    @State private var sportChange = false
    @State private var old : Int = 0
    @State private var stop = false
    var sports :[String] = ["run","basketball","baseball","soccer","pool.swim"]
    var alertText :[String] = ["慢跑","籃球","棒球","足球","游泳"]
    
    var body: some View {
        VStack {
            if sportToday {
                if showSport {
                    if sportChange {
                        Image(systemName: "figure."+sports[num])
                            .resizable()
                            .padding(.bottom)
                            .frame(width: 250.0, height: 300.0)
                    } else{
                        Image(systemName: "figure."+sports[old])
                            .resizable()
                            .padding(.bottom)
                            .frame(width: 250.0, height: 300.0)
                    }
                } else{
                    Image(systemName: "figure.cooldown")
                        .resizable()
                        .padding(.bottom)
                        .frame(width: 250.0, height: 300.0)
                }
                Spacer()
                    .frame(height: 50.0)
                Button {
                    showalert = true
                    sportChange = false
                    if stop {
                        old = old
                    } else{
                        old = num
                    }
                    num = Int.random(in:0 ... 4)
                } label: {
                    Text("今天的運動是...")
                }
                .alert("今天的運動是"+alertText[num], isPresented: $showalert) {
                    Button("GoGoGo"){
                        showSport = true
                        sportChange = true
                        stop = false
                    }
                    Button("休息一天", role: .destructive){
                        sportToday = false
                    }
                    Button("再抽一次", role: .cancel){
                        sportChange = false
                        stop = true
                    }
                }
            } else {
                VStack {
                    Text("美國睡眠基金會指出，即使處於熟睡狀態，人體也不斷地在燃燒卡路里，在夜間每小時約能消耗50大卡的熱量。")
                        .multilineTextAlignment(.center)
                    Image("sleep")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                    .frame(height: 50.0)
                Button {
                    showalertSleep = true
                } label: {
                    Text("忍痛跟床分手")
                }
                .padding(.bottom)
                .alert("確定嗎", isPresented: $showalertSleep) {
                    Button("確定QQ"){
                        sportToday = true
                        showSport = false
                    }
                    Button("再睡一下"){
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
