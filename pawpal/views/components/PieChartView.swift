//
//  PieChart.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 11/06/23.
//

import SwiftUI

struct PieChartView: View {
    var data: [Double] // Array berisi persentase data
        var labels: [String] // Array berisi keterangan/label
        
        var body: some View {
            VStack {
                ZStack {
                    // Lingkaran luar
                    Circle()
//                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: 200, height: 200)
                    
                    // Sektor-sektor lingkaran
                    ForEach(0..<data.count, id: \.self) { index in
                        PieSlice(startAngle: angle(for: index), endAngle: angle(for: index + 1))
                            .fill(pieColors[index % pieColors.count]) // Array warna untuk setiap sektor
                            .frame(width: 240, height: 240)
                    }
                }
                
                // Keterangan/label
                HStack {
                    ForEach(0..<data.count, id: \.self) { index in
                        LabelView(color: pieColors[index % pieColors.count], label: labels[index], value: data[index])
                    }
                }
            }
        }
        
        private func angle(for index: Int) -> Angle {
            let total = data.reduce(0, +)
            let startAngle = index == 0 ? .degrees(0) : angle(for: index - 1)
            let endAngle = startAngle + .degrees((data[index % data.count] / total) * 360)
            return endAngle
        }
    
    // Array warna untuk setiap sektor
    private let pieColors: [Color] = [Color("green800"), Color("green600"), Color("pink800"), Color("pink600"), Color("orange600"), Color("orange400")]
}

struct LabelView: View {
    var color: Color
    var label: String
    var value: Double
    
    var body: some View {
        VStack{
            HStack {
                
                HStack(spacing: 12) {
                    Circle()
                        .fill(color)
                        .frame(width: 16, height: 16)
                    Text(label)
                        .font(.subheadline)
                        .fontDesign(.rounded)
                        .fontWeight(.regular)
                        .foregroundColor(Color("neutral600"))
                }
                
                Spacer()
                    
                    Text(String(format: "%.0f", value))
                        .font(.callout)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundColor(Color("neutral800"))
            }
        }

    }
}

struct PieSlice: Shape {
    let startAngle: Angle
    let endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        path.move(to: center)
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.closeSubpath()
        
        return path
    }
}
