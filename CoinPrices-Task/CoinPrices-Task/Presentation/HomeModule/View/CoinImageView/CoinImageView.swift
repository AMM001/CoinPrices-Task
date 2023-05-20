//
//  CoinImageView.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct CoinImageView: View {
    
    private let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
    }
    
    var body: some View {
        ZStack {
            let url = URL(string: coin.image)
            KFImage(url)
                .resizable()
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
