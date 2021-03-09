//
//  SpeechView.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/3/8.
//

import SwiftUI
import SwiftSpeech
import SwiftUIX

struct SpeechView: View {
    @State var audioText = ""
    var body: some View {
        VStack{
            HStack {
                TextField("长按语音输入或者手动打字输入", text: $audioText)
                    .frame(width: UIScreen.main.bounds.width/2)
                Button(action: {
                    let isApple = (audioText as NSString).contains("苹果")
                    let isbarnana = (audioText as NSString).contains("香蕉")
                    //定义食材数据
                    if(isApple){
                        print("检测到关键词等待后续输入")
                        self.audioText = "买多少苹果啊"
                        let howMany = (audioText as NSString).contains("个")
                        if(howMany){
                            self.audioText = "好的~"
                        }
                    }
                    //判断买苹果
                    if(isbarnana){
                        print("检测到关键词等待后续输入")
                        self.audioText = "买多少香蕉啊"
                        let howMany = (audioText as NSString).contains("个")
                        if(howMany){
                            self.audioText = "好的~"
                        }
                    }
                    //判断买香蕉
                })
                {
                    Text("开始")
                }
            }
            .padding()
            SwiftSpeech.RecordButton()
                .swiftSpeechRecordOnHold()//方式为长按说话
                .onRecognizeLatest(update: $audioText)
        }.onAppear{SwiftSpeech.requestSpeechRecognitionAuthorization()}
        //请求语音权限
    }
    
    
}

struct SpeechView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechView()
    }
}
