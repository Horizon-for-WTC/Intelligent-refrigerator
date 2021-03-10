//
//  WeatherView.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/3/10.
//

import SwiftUI


struct WeatherView: View {
    
    @ObservedObject var localArea = LocationViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Text("天气-\(localArea.myLocalArea)")
                        .font(.headline)
                    HStack{
                        Button(action: {}, label: {
                            Image(systemName: "pencil")
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "list.dash")
                        })
                    }
                }
                .padding()//顶部标签栏？？？是叫标签栏吧？？？
                ScrollView{
                    MainCardView()
                    OneDayView()
                }
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
