//
//  TimeAndWeatherView.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/2/4.
//

import SwiftUI

struct TimeAndWeatherView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Text("00:00")
                        .font(.custom("", size: 75))
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                    Image(systemName: "drop.fill")
                        .resizable()
                        .frame(width: 30, height: 50)
                }
                HStack{
                    Text("10月31日 | 星期几")
                        .font(.custom("", size: 23))
                        .padding(.horizontal)
                    Text("99℃")
                        .font(.custom("", size: 20))
                }
            }.padding()
            Spacer()
        }
    }
}

struct TimeAndWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TimeAndWeatherView()
    }
}
