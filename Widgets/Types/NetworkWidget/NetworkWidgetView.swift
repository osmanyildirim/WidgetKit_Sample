//
//  NetworkWidgetView.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI

struct NetworkWidgetView: View {
    /// Entry for NetworkWidget's View
    var entry: NetworkWidgetEntry

    /// Widget family
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        if widgetFamily == .systemSmall {
            smallNetworkWidgetView
        } else if widgetFamily == .systemMedium {
            mediumNetworkWidgetView
        }
    }
}

extension NetworkWidgetView {
    /// Widget view for `Small` size.
    private var smallNetworkWidgetView: some View {
        VStack {
            HStack {
                Image(uiImage: entry.rates?.imageUSD ?? .init()).resizable().frame(width: 25, height: 25, alignment: .trailing)
            }.padding(.top, 10).frame(maxWidth: .infinity)
            Divider().background(.white).padding(.leading, 5).padding(.trailing, 5)

            VStack {
                HStack {
                    Image(uiImage: entry.rates?.imageEUR ?? .init()).resizable().frame(width: 25, height: 25, alignment: .trailing)
                    Text(amountFormat(entry.rates?.EUR, code: "EUR", maxLong: entry.rates?.maxCharachter ?? 0)).font(Font.custom("HelveticaNeue", size: 11)).foregroundColor(.white)
                }.frame(maxWidth: .infinity)

                HStack {
                    Image(uiImage: entry.rates?.imageGBP ?? .init()).resizable().frame(width: 25, height: 25, alignment: .trailing)
                    Text(amountFormat(entry.rates?.GBP, code: "GBP", maxLong: entry.rates?.maxCharachter ?? 0)).font(Font.custom("HelveticaNeue", size: 11)).foregroundColor(.white)
                }.padding(.top, 5).frame(maxWidth: .infinity)

                HStack {
                    Image(uiImage: entry.rates?.imageTRY ?? .init()).resizable().frame(width: 25, height: 25, alignment: .trailing)
                    Text(amountFormat(entry.rates?.TRY, code: "TRY", maxLong: entry.rates?.maxCharachter ?? 0)).font(Font.custom("HelveticaNeue", size: 11)).foregroundColor(.white)
                }.padding(.top, 5).frame(maxWidth: .infinity)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.black)
    }

    /// Widget view for `Medium` size.
    private var mediumNetworkWidgetView: some View {
        HStack {
            HStack {
                Image(uiImage: entry.rates?.imageUSD ?? .init()).resizable().frame(width: 40, height: 40, alignment: .trailing)
                VStack(alignment: .leading) {
                    Text("USD").font(Font.custom("HelveticaNeue", size: 18)).foregroundColor(.white)
                    Text("US Dollar").font(Font.custom("HelveticaNeue", size: 10)).foregroundColor(.gray)
                }
            }.padding(.leading, 15)

            Divider().background(.gray).padding(.top, 50).padding(.bottom, 50).padding(.leading, 10)

            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        HStack {
                            Image(uiImage: entry.rates?.imageEUR ?? .init()).resizable().frame(width: 30, height: 30, alignment: .trailing)
                            VStack(alignment: .leading) {
                                Text("EUR").font(Font.custom("HelveticaNeue", size: 18)).foregroundColor(.white)
                                Text("Euro").font(Font.custom("HelveticaNeue", size: 10)).foregroundColor(.gray)
                            }
                            Spacer()
                            Text(amountFormat(entry.rates?.EUR, symbol: "€")).font(Font.custom("HelveticaNeue", size: 20)).foregroundColor(.white)
                        }
                    }

                    HStack {
                        Image(uiImage: entry.rates?.imageGBP ?? .init()).resizable().frame(width: 30, height: 30, alignment: .trailing)
                        VStack(alignment: .leading) {
                            Text("GBP").font(Font.custom("HelveticaNeue", size: 18)).foregroundColor(.white)
                            Text("British Pound").font(Font.custom("HelveticaNeue", size: 10)).foregroundColor(.gray)
                        }
                        Spacer()
                        Text(amountFormat(entry.rates?.GBP, symbol: "£")).font(Font.custom("HelveticaNeue", size: 20)).foregroundColor(.white)
                    }

                    HStack {
                        Image(uiImage: entry.rates?.imageTRY ?? .init()).resizable().frame(width: 30, height: 30, alignment: .trailing)
                        VStack(alignment: .leading) {
                            Text("TRY").font(Font.custom("HelveticaNeue", size: 18)).foregroundColor(.white)
                            Text("Turkish Lira").font(Font.custom("HelveticaNeue", size: 10)).foregroundColor(.gray)
                        }
                        Spacer()
                        Text(amountFormat(entry.rates?.TRY, symbol: "₺")).font(Font.custom("HelveticaNeue", size: 20)).foregroundColor(.white)
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }.padding(.leading, 10).padding(.trailing, 10)
        }.background(.black)
    }
}

extension NetworkWidgetView {
    /// Format amount to show on Widget's view.
    private func amountFormat(_ amount: Double?, code: String = "", maxLong: Int = 0, symbol: String = "") -> String {
        var text = String(format: "%.2f", amount ?? 0)

        if maxLong != 0 {
            text += (" " + code)

            if text.count < maxLong {
                for _ in 0 ..< (maxLong - text.count) {
                    text = " " + text
                }
            }
        } else {
            text = symbol + " " + text
        }
        return text
    }
}
