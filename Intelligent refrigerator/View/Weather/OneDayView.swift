//
//  OneDaysView.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/3/10.
//

import SwiftUI
import SwiftUICharts

struct OneDayView: View {
    
    @ObservedObject var cyJsonXXIV = CaiYunJsonXXIV()
    
    init() {
        
        cyJsonXXIV.cyNetworkStartXXIV()
    }//view初始化时候进行网络请求
    
    var body: some View {
        
        
        ZStack{
            Rectangle()
                .fill(Color("Background"))
                .cornerRadius(10)
                .frame(height: UIScreen.main.bounds.height/4)
            VStack{
                HStack{
                    Text("48小时温度(当前时间开始计算)")
                        .font(.subheadline)
                    Spacer()
                }
                .padding(.horizontal)
                HStack {
                    LineChartView(data: cyJsonXXIV.highTem, title: "",form: ChartForm.extraLarge, dropShadow: false).padding(.leading)
                    LineChartView(data: cyJsonXXIV.highTem2, title: "",form: ChartForm.extraLarge, dropShadow: false).padding(.trailing)
                }
            }
        }.padding()
    }
}

struct OneDayView_Previews: PreviewProvider {
    static var previews: some View {
        OneDayView()
    }
}
