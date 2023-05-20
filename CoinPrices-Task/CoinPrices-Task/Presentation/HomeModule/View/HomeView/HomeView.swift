//
//  HomeView.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

import SwiftUI

struct HomeView: View {
    
  @EnvironmentObject private var vm: HomeViewModel
    
    let start = Date().addingTimeInterval(-30)
    let end = Date().addingTimeInterval(90)
    
    var body: some View {
        VStack{
            if vm.isLoading {
                ProgressView("loading.....")
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: 120, height: 120, alignment: .center)
                    .scaleEffect(2)
                    .font(.system(size: 15))
            }
            columnTitles
            allCoinsList
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(false)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
