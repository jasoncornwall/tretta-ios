//
//  DonutChart.swift
//  Tretta
//
//  Created by Jason C on 4/17/23.
//

import SwiftUI

struct DonutChart : View {
    @ObservedObject var charDataObj = ChartDataContainer()
    @State private var indexOfTappedSlice = -1
    @State private var show = false
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<charDataObj.chartData.count, id: \.self) { index in
                    Circle()
                        .trim(from: index == 0 ? 0.0 : charDataObj.chartData[index-1].value,
                              to: charDataObj.chartData[index].value)
                        .stroke(charDataObj.chartData[index].stageColor,lineWidth: 40)
                        .onTapGesture {
                            indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                            show.toggle()
                        }
                        .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                        .animation(.spring(), value: show)
                }
                if indexOfTappedSlice != -1 {
                    Text(String(format: "%.2f", Double(charDataObj.chartData[indexOfTappedSlice].percentage))+"%")
                        .font(.title)
                        .foregroundColor(.white)
                } else {
                    Text("Pipeline Progress")
                        .frame(width: 75)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .frame(width: 160, height: 160)
            .padding()
            .onAppear() {
                show = true
                self.charDataObj.calc()
            }
        }
    }
}

//struct DonutChart_Previews: PreviewProvider {
//    static var previews: some View {
//        DonutChart()
//    }
//}
