//
//  OneDaysView.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/3/10.
//

import SwiftUI
import SwiftUICharts

struct OneDayView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("Background"))
                .cornerRadius(10)
                .frame(height: UIScreen.main.bounds.height/4)
            VStack{
                HStack{
                    Text("24小时温度")
                        .font(.subheadline)
                    Spacer()
                }
                .padding(.horizontal)
                HStack {
                    LineChartView(data: [90,99,78,111,70,60,77], title: "",form: ChartForm.extraLarge, dropShadow: false).padding(.horizontal)
                    

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
