//
//  HomeView.swift
//  Karbon
//
//  Created by Ajay Sharma on 2020-01-25.
//  Copyright © 2020 MrGoose. All rights reserved.
//

    /*
    Arc(startAngle: .degrees(270), endAngle: .degrees(80), clockwise: false)
        .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        .frame(width: 300, height: 300)
    Arc(startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
        .stroke(Color.red.opacity(0.1), lineWidth: 10)
        .frame(width: 300, height: 300)
        
    
    Arc(startAngle: .degrees(270), endAngle: .degrees(200), clockwise: false)
        .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        .frame(width: 270, height: 270)
    Arc(startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
        .stroke(Color.green.opacity(0.1), lineWidth: 10)
    .frame(width: 270, height: 270)
        
*/

import SwiftUI

struct HomeView: View {
    @State var drawRed = false
    @State var drawGreen = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Circle()
                        .trim(from: 0, to: drawRed ? 1/2 : 0)
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .animation(Animation.easeOut(duration: 2.5))
                        .frame(width: 300, height: 300)
                        .rotationEffect(.degrees(270))
                        .onAppear() {
                            self.drawRed.toggle()
                        }
                    Circle()
                        .stroke(Color.red.opacity(0.2), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .frame(width: 300, height: 300)

                    
                    Circle()
                        .trim(from: 0, to: drawGreen ? 2/3 : 0)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .animation(Animation.easeOut(duration: 2.5))
                        .rotationEffect(.degrees(270))
                        .frame(width: 270, height: 270)
                        .onAppear() {
                            self.drawGreen.toggle()
                        }
                    Circle()
                        .stroke(Color.green.opacity(0.2), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .frame(width: 270, height: 270)
                    
                    VStack {
                        Text("CO2 Footprint")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                            .offset(x: 0, y: -10)
                        Text("Points")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.green)
                            .offset(x: 0, y: 10)
                    }
                
                }.padding(.vertical)

                List {
                    Section(header: Text("Break Down")) {                            HStack {
                            Text("Driving")
                                .foregroundColor(Color.black)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .padding(.vertical)
                        }
                        HStack {
                            Text("Food")
                                .foregroundColor(Color.black)
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .padding(.vertical)
                                .padding(.leading, 14)
                        }
                        HStack {
                            Text("Other")
                                .foregroundColor(Color.black)
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .padding(.vertical)
                                .padding(.leading, 10)
                        }
                    }
                    
                }.listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                .environment(\.defaultMinListRowHeight, 100)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
