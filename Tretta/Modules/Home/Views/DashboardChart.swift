//
//  DashboardChart.swift
//  Tretta
//
//  Created by Jason C on 10/10/23.
//

import Charts
import SwiftUI

struct DashboardChart: View {
    
    enum ChartType {
        case bar
        case donut
        case point
    }
    
    @Binding var deals: [Deal]
    
    let chartType: ChartType
    
    var body: some View {
        VStack(alignment: .leading) {
            switch chartType {
            case .bar:
                Text("Property Deals")
                    .font(.system(size: 16, weight: .bold))
                Text("Total: $\(deals.reduce(0, { $0 + $1.value }))")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.bottom, 12)
                Chart {
                    ForEach(deals) { deal in
                        BarMark(
                            x: .value("Deal Name", deal.name),
                            y: .value("Deal Value", deal.value)
                        )
                        .foregroundStyle(Color.trettaGold.gradient.opacity(0.65))
                        .cornerRadius(4)
                    }
                }
                .frame(height: 200)
                .chartYAxis {
                    AxisMarks(
                        format: Decimal.FormatStyle.Currency(code: "USD").rounded(),
                        values: .automatic(desiredCount: 6)
                    )
                }
                .chartXAxis(.hidden)
                .aspectRatio(contentMode: .fill)
            case .donut:
                Chart {
                    ForEach(deals) { deal in

                    }
                }
                .frame(height: 325)
            case .point:
                Chart {
                    ForEach(deals) { deal in
                        PointMark(
                            x: .value("Deal Name", deal.name),
                            y: .value("Deal Value", deal.value)
                        )
                        .foregroundStyle(by: .value("Deal", deal.name))
                        .symbol(by: .value("Deal", deal.name))
                        .cornerRadius(4)
                    }
                }
                .frame(height: 325)
                .chartYAxis {
                    AxisMarks(
                        format: Decimal.FormatStyle.Currency(code: "USD").rounded(),
                        values: .automatic(desiredCount: 6)
                    )
                }
                .chartXAxis(.hidden)
                .aspectRatio(contentMode: .fill)
            }
        }
    }
}
