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
       "php": 66434446930386.266,
       "pkr": 340228943900327.4,
       "pln": 5228902655419.935,
       "rub": 99001583350073.44,
       "sar": 4573380397165.368,
       "sek": 12767873142183.717,
       "sgd": 1621297871955.1501,
       "thb": 41372587067556.484,
       "try": 23467853879025.906,
       "twd": 37073687352607.32,
       "uah": 44512402670164.37,
       "vef": 122078926093.29883,
       "vnd": 28584244704458130,
       "zar": 22036764069188.156,
       "xdr": 898314601630.3516,
       "xag": 48815062411.160484,
       "xau": 607273467.4704018,
       "bits": 43645047614778.375,
       "sats": 4364504761477837.5
     },
     "total_volume": {
       "btc": 1184824.7521303934,
       "eth": 17992531.754054062,
       "ltc": 367732872.9080255,
       "bch": 266963110.50910828,
       "bnb": 106640984.25932638,
       "eos": 27851248557.863842,
       "xrp": 65706264169.74335,
       "xlm": 319510083639.58044,
       "link": 4656794263.678933,
       "dot": 5417255717.067265,
       "yfi": 3845750.513719672,
       "usd": 33097533534.23093,
       "aed": 121554001657.81693,
       "ars": 6930997855172.224,
       "aud": 49606616358.63882,
       "bdt": 3479341871694.2095,
       "bhd": 12400487401.602604,
       "bmd": 33097533534.23093,
       "brl": 167366945625.22845,
       "cad": 44878600595.74048,
       "chf": 29971901759.85876,
       "clp": 26932769892915.324,
       "cny": 227403223653.64014,
       "czk": 707661674248.7445,
       "dkk": 226076012558.91797,
       "eur": 30103729235.92562,
       "gbp": 26646427078.006954,
       "hkd": 259807363860.32965,
       "huf": 11397797623183.1,
       "idr": 494508593658267.6,
       "ils": 118820079192.82239,
       "inr": 2708718627013.161,
       "jpy": 4374002951231.9995,
       "krw": 43570917045802.95,
       "kwd": 10153992312.966703,
       "lkr": 10509743104913.87,
       "mmk": 69024147126804.56,
       "mxn": 599919273334.7625,
       "myr": 145728440151.21872,
       "ngn": 15132017312093.098,
       "nok": 347361924195.10724,
       "nzd": 52804003585.7132,
       "php": 1803484734670.3801,
       "pkr": 9236137801526.783,
       "pln": 141948139163.53976,
       "rub": 2687579298539.9146,
       "sar": 124152786893.39041,
       "sek": 346607300430.5267,
       "sgd": 44013100093.820335,
       "thb": 1123134648631.077,
       "try": 637077874233.6436,
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
    let total_market_cap, total_volume, market_cap_percentage: [String: Double]
    let market_cap_change_percentage_24h_usd: Double
    
    var marketCup: String {
        
        if let item = total_market_cap.first(where: {$0.key == "usd"}) {
            return "\(item.value)"
        }
        return ""
    }
    
    var volume: String {
        if let item = total_volume.first(where: {$0.key == "usd"}){
            return "\(item.value)"
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = market_cap_percentage.first(where: { $0.key == "btc"}){
            return item.value.aspercentString()
        }
        return ""
    }
}
