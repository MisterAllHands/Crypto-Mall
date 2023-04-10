//
//  MarketDataModel.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 09/04/2023.
//

import Foundation
import SwiftUI

//JSON Data:
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSONResponse:
 {
   "data": {
     "active_cryptocurrencies": 10854,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 710,
     "total_market_cap": {
       "btc": 43645047.61477838,
       "eth": 662785702.0239551,
       "ltc": 13546069761.56732,
       "bch": 9834043092.540895,
       "bnb": 3928303175.061375,
       "eos": 1025948409039.667,
       "xrp": 2420402699320.085,
       "xlm": 11769700783830.873,
       "link": 171540986973.00513,
       "dot": 199553886165.6147,
       "yfi": 141664802.31279075,
       "usd": 1219204295349.0364,
       "aed": 4477649695098.886,
       "ars": 255315168646668.4,
       "aud": 1827344617073.4297,
       "bdt": 128167512862251.28,
       "bhd": 456793177316.94574,
       "bmd": 1219204295349.0364,
       "brl": 6165247896635.106,
       "cad": 1653180064278.5276,
       "chf": 1104066299309.1592,
       "clp": 992114675407113.5,
       "cny": 8376786952054.613,
       "czk": 26067928959287.27,
       "dkk": 8327896859811.135,
       "eur": 1108922390017.5352,
       "gbp": 981566747733.9667,
       "hkd": 9570448917416.113,
       "huf": 419857383189347.5,
       "idr": 18216070416595184,
       "ils": 4376940981894.4653,
       "inr": 99780286695104.28,
       "jpy": 161123884971549.16,
       "krw": 1605009302569285,
       "kwd": 374039685770.13074,
       "lkr": 387144375071743.5,
       "mmk": 2542622596719107,
       "mxn": 22099053216637.547,
       "myr": 5368156512421.805,
       "ngn": 557413756681267.3,
       "nok": 12795671000117.68,
       "nzd": 1945125848025.6238,
   
       "sats": 4364504761477837.5
     },
     "total_volume": {
       "btc": 1184824.7521303934,
  
   
       "twd": 1006433142559.7809,
       "uah": 1208370693644.243,
       "vef": 3314056032.782538,
       "vnd": 775971673710043.4,
       "zar": 598228320346.4984,
       "xdr": 24386395098.15549,
       "xag": 1325174272.5089612,
       "xau": 16485550.47806509,
       "bits": 1184824752130.3933,
       "sats": 118482475213039.34
     },
     "market_cap_percentage": {
       "btc": 44.31514927125647,
       "eth": 18.170625198347864,
       "usdt": 6.587611910543413,
       "bnb": 4.020009983877156,
       "usdc": 2.6757973422803394,
       "xrp": 2.1376053985630468,
       "ada": 1.1116028029404075,
       "doge": 0.9294593585947185,
       "steth": 0.8907750443801484,
       "matic": 0.8231927326506622
     },
     "market_cap_change_percentage_24h_usd": -0.8730458268430333,
     "updated_at": 1681033008
   }
 }
 /**/*/
 
 

struct MData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap =  "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCup: String {
        
        if let item = totalMarketCap.first(where: {$0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: {$0.key == "usd"}){
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}){
            return item.value.aspercentString()
        }
        return ""
    }
}
