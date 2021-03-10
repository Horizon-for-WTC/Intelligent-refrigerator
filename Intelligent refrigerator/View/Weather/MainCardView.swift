//
//  MainCardView.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/3/10.
//

import SwiftUI

struct MainCardView: View {
    @ObservedObject var cyJsonRT = CaiYunJsonRealtime()
    
    //@Environment(\.colorScheme) var colorScheme//暗黑模式用
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("Background"))
                .cornerRadius(10)
            VStack{
                HStack{
                    Text("空气质量-\(cyJsonRT.airQuality)")
                        .font(.caption2)
                    Spacer()
                }
                Spacer()
                Text("\(cyJsonRT.nowTem)℃")
                    .fontWeight(.heavy)
                    .font(.custom("", size: UIScreen.main.bounds.width/10))
                    .padding()
                HStack{
                    Group{
                        Text("\(cyJsonRT.skycon)")
                        Text("\(cyJsonRT.windDirection)")
                        Text("湿度\(cyJsonRT.humidity)%")
                    }.font(.caption)
                }
                Spacer()
            }
            .padding()
        }
        .frame(height: UIScreen.main.bounds.height/3)
        .padding()
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView().preferredColorScheme(.light)
    }
}
