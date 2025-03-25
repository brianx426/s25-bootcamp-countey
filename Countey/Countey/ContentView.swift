//
//  ContentView.swift
//  Countey
//
//  Created by Brian Liu on 3/25/25.
//

import SwiftUI

struct ContentView : View {
  @State private var count: Int = 0
  @State private var maxCount: Int = 1
  var body: some View {
    ZStack {
      Color.blue
        .ignoresSafeArea()
      Color.red
        .ignoresSafeArea()
        .opacity(count == 0 ? 0 : Double(Double(count) / Double(maxCount)))
      
      VStack {
        NavigationStack {
          VStack {
            HStack {
              Text(count == 1 ? "\(count) person" :"\(count) people")
                .font(.system(size: 64))
                .foregroundStyle(Color.white)
              
              Spacer()
              
              NavigationLink {
                SettingsView(maxCount: $maxCount)
              } label: {
                Image(systemName: "gear")
                  .resizable()
                  .frame(width: 64, height: 64)
                  .foregroundStyle(Color.white)
              }
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack {
              Button {
                if (count > 0) {
                  count -= 1
                }
              } label: {
                Image(systemName: "minus")
                  .resizable()
                  .frame(width: 64, height: 8)
                  .foregroundStyle(Color.white)
              }
              Spacer()
              Button {
                if (count < maxCount) {
                  count += 1
                }
              } label: {
                Image(systemName: "plus")
                  .resizable()
                  .frame(width: 64, height: 64)
                  .foregroundStyle(Color.white)
              }
            }
            .padding(.horizontal)
          }
          .background(ZStack {
            Color.blue.ignoresSafeArea()
            Color.red.ignoresSafeArea().opacity(count == 0 ? 0 : Double(Double(count) / Double(maxCount)))
          })
        }
      }
    }
  }
}

struct SettingsView : View {
  @Binding var maxCount: Int
  var body : some View {
    ZStack {
      Color.black.ignoresSafeArea()
      VStack {
        HStack(alignment: .top) {
          Stepper("Maximum Occupancy: \(maxCount)", value: $maxCount, in: 1...100)
            .padding(.horizontal)
        }
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 12.5))
        .padding()
        
        Spacer()
        
        Text("")
      }
    }
  }
}

#Preview {
  ContentView()
}
