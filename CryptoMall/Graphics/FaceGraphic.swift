//
//  FaceGraphic.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 2021-04-07.
//

import SwiftUI

struct FaceGraphic: View {
    @State var appear = false
    @Binding var selection: Int
    @State var active = true
    
    var body: some View {
        ZStack {
            LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.21568627655506134, green: 0.1568627506494522, blue: 0.23529411852359772, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.18431372940540314, green: 0.12156862765550613, blue: 0.38823530077934265, alpha: 1)), location: 0.7280455231666565),
                    .init(color: Color(#colorLiteral(red: 0.23137255012989044, green: 0.05882352963089943, blue: 0.32156863808631897, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5376673649106496, y: 0.09218306417010338),
                        endPoint: UnitPoint(x: 0.5461761658937747, y: 1.1229542670763588))
                .overlay(
                    InsideFace1()
                )
                .overlay(
                    InsideFace2()
                )
                .overlay(
                    InsideFace3()
                )
                .overlay(
                    InsideFace4()
                )
                .overlay(
                    InsideFace5()
                )
                .overlay(
                    Line1()
                )
                .overlay(
                    Line2()
                )
                .overlay(
                    Stars().opacity(0)
                )
                .mask(Facemask())
                .frame(width: 522, height: 405, alignment: .center)
                .offset(x: -90, y: -280)
            
            ZStack {
                PurplePlanet()
                    .offset(x: appear ? 100 : 0, y: 20)
                YellowPlanet()
                    .offset(x: appear ? 100 : 200, y: 100)
                RedPlanet().offset(x: appear ? -70 : 0)
            }
        }
        .opacity(active ? 1 : 0)
        .onAppear {
            update()
        }
        .onChange(of: selection, perform: { value in
            update()
        })
    }
    
    func update() {
        if selection == 0 {
            withAnimation(.linear(duration: 10)) {
                appear = true
            }
            withAnimation {
                active = true
            }
        } else {
            withAnimation(.linear(duration: 10)) {
                appear = false
            }
            withAnimation {
                active = false
            }
        }
    }
}

struct FaceGraphic_Previews: PreviewProvider {
    static var previews: some View {
        FaceGraphic(selection: .constant(0))
    }
}

struct Star: View {
    var body: some View {
        Circle().fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .frame(width: 3.4, height: 3.4)
            .offset(x: 200, y: 0)
        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius:2, x:0, y:0)
        .opacity(0.6)
    }
}

struct Star2: View {
    var body: some View {
        Circle().fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .frame(width: 2.3, height: 2.3)
        .offset(x: 0, y: 0)
        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius:2, x:0, y:0)
        .opacity(0.6)
    }
}

struct Star3: View {
    var body: some View {
        Circle().fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .frame(width: 1, height: 1)
            .offset(x: 0, y: 0)
        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius:1, x:0, y:0)
        .opacity(0.9)
    }
}

struct SaturnRing: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.69817*width, y: 0.35633*height))
        path.addCurve(to: CGPoint(x: 0.83072*width, y: 0.54354*height), control1: CGPoint(x: 0.75265*width, y: 0.41535*height), control2: CGPoint(x: 0.79837*width, y: 0.47971*height))
        path.addCurve(to: CGPoint(x: 0.87736*width, y: 0.77254*height), control1: CGPoint(x: 0.87497*width, y: 0.63087*height), control2: CGPoint(x: 0.89146*width, y: 0.7118*height))
        path.addCurve(to: CGPoint(x: 0.75342*width, y: 0.87666*height), control1: CGPoint(x: 0.86327*width, y: 0.83329*height), control2: CGPoint(x: 0.81947*width, y: 0.87008*height))
        path.addCurve(to: CGPoint(x: 0.69313*width, y: 0.87495*height), control1: CGPoint(x: 0.73468*width, y: 0.87852*height), control2: CGPoint(x: 0.71447*width, y: 0.87792*height))
        path.addCurve(to: CGPoint(x: 0.51515*width, y: 0.80861*height), control1: CGPoint(x: 0.63927*width, y: 0.86744*height), control2: CGPoint(x: 0.57819*width, y: 0.84483*height))
        path.addCurve(to: CGPoint(x: 0.27073*width, y: 0.59929*height), control1: CGPoint(x: 0.42714*width, y: 0.75803*height), control2: CGPoint(x: 0.34076*width, y: 0.68406*height))
        path.addCurve(to: CGPoint(x: 0.23562*width, y: 0.55395*height), control1: CGPoint(x: 0.25837*width, y: 0.58432*height), control2: CGPoint(x: 0.24665*width, y: 0.56918*height))
        path.addCurve(to: CGPoint(x: 0.13112*width, y: 0.34374*height), control1: CGPoint(x: 0.18419*width, y: 0.48294*height), control2: CGPoint(x: 0.14779*width, y: 0.41*height))
        path.addCurve(to: CGPoint(x: 0.15969*width, y: 0.15795*height), control1: CGPoint(x: 0.11087*width, y: 0.26326*height), control2: CGPoint(x: 0.12097*width, y: 0.1976*height))
        path.addCurve(to: CGPoint(x: 0.27511*width, y: 0.11717*height), control1: CGPoint(x: 0.18668*width, y: 0.13032*height), control2: CGPoint(x: 0.2264*width, y: 0.11651*height))
        path.addCurve(to: CGPoint(x: 0.29695*width, y: 0.01705*height), control1: CGPoint(x: 0.2817*width, y: 0.08183*height), control2: CGPoint(x: 0.289*width, y: 0.04837*height))
        path.addLine(to: CGPoint(x: 0.29526*width, y: 0.01308*height))
        path.addCurve(to: CGPoint(x: 0.05541*width, y: 0.05441*height), control1: CGPoint(x: 0.19071*width, y: -0.01194*height), control2: CGPoint(x: 0.10594*width, y: 0.00266*height))
        path.addCurve(to: CGPoint(x: 0.01812*width, y: 0.29686*height), control1: CGPoint(x: 0.00487*width, y: 0.10615*height), control2: CGPoint(x: -0.00831*width, y: 0.19183*height))
        path.addCurve(to: CGPoint(x: 0.20032*width, y: 0.63036*height), control1: CGPoint(x: 0.04454*width, y: 0.40188*height), control2: CGPoint(x: 0.10893*width, y: 0.51974*height))
        path.addCurve(to: CGPoint(x: 0.2366*width, y: 0.67232*height), control1: CGPoint(x: 0.21207*width, y: 0.64459*height), control2: CGPoint(x: 0.22418*width, y: 0.65859*height))
        path.addCurve(to: CGPoint(x: 0.51929*width, y: 0.90352*height), control1: CGPoint(x: 0.32074*width, y: 0.76532*height), control2: CGPoint(x: 0.41921*width, y: 0.84601*height))
        path.addCurve(to: CGPoint(x: 0.68104*width, y: 0.9746*height), control1: CGPoint(x: 0.5751*width, y: 0.93559*height), control2: CGPoint(x: 0.62973*width, y: 0.95949*height))
        path.addCurve(to: CGPoint(x: 0.83023*width, y: 0.99233*height), control1: CGPoint(x: 0.73534*width, y: 0.99059*height), control2: CGPoint(x: 0.78592*width, y: 0.99674*height))
        path.addCurve(to: CGPoint(x: 0.99198*width, y: 0.85646*height), control1: CGPoint(x: 0.91642*width, y: 0.98374*height), control2: CGPoint(x: 0.97359*width, y: 0.93573*height))
        path.addCurve(to: CGPoint(x: 0.9311*width, y: 0.5576*height), control1: CGPoint(x: 1.01037*width, y: 0.77719*height), control2: CGPoint(x: 0.98886*width, y: 0.67157*height))
        path.addCurve(to: CGPoint(x: 0.68659*width, y: 0.24177*height), control1: CGPoint(x: 0.87539*width, y: 0.44766*height), control2: CGPoint(x: 0.78927*width, y: 0.3365*height))
        path.addCurve(to: CGPoint(x: 0.69817*width, y: 0.35633*height), control1: CGPoint(x: 0.69118*width, y: 0.27864*height), control2: CGPoint(x: 0.69506*width, y: 0.3169*height))
        path.closeSubpath()
        return path
    }
}

struct YShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.10609*width, y: 0.36312*height))
        path.addCurve(to: CGPoint(x: -0.22552*width, y: 0.62698*height), control1: CGPoint(x: -0.05408*width, y: 0.71251*height), control2: CGPoint(x: -0.18589*width, y: 0.64821*height))
        path.addLine(to: CGPoint(x: -0.13167*width, y: 0.99093*height))
        path.addCurve(to: CGPoint(x: 0.19994*width, y: 0.57239*height), control1: CGPoint(x: -0.0837*width, y: 0.9515*height), control2: CGPoint(x: 0.04978*width, y: 0.81259*height))
        path.addCurve(to: CGPoint(x: 0.64418*width, y: 0.40862*height), control1: CGPoint(x: 0.38765*width, y: 0.27214*height), control2: CGPoint(x: 0.50653*width, y: 0.30853*height))
        path.addCurve(to: CGPoint(x: 1.05713*width, y: 0.44501*height), control1: CGPoint(x: 0.7543*width, y: 0.48868*height), control2: CGPoint(x: 0.96536*width, y: 0.46624*height))
        path.addLine(to: CGPoint(x: 0.98205*width, y: 0.08107*height))
        path.addCurve(to: CGPoint(x: 0.72552*width, y: 0.08107*height), control1: CGPoint(x: 0.93407*width, y: 0.09926*height), control2: CGPoint(x: 0.8957*width, y: 0.16841*height))
        path.addCurve(to: CGPoint(x: 0.10609*width, y: 0.36312*height), control1: CGPoint(x: 0.51278*width, y: -0.02812*height), control2: CGPoint(x: 0.30631*width, y: -0.07361*height))
        path.closeSubpath()
        return path
    }
}

struct YShape1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.15614*width, y: 0.3025*height))
        path.addCurve(to: CGPoint(x: -0.16295*width, y: 0.65223*height), control1: CGPoint(x: -0.00403*width, y: 0.63005*height), control2: CGPoint(x: -0.12333*width, y: 0.67213*height))
        path.addLine(to: CGPoint(x: -0.0691*width, y: 0.99342*height))
        path.addCurve(to: CGPoint(x: 0.26251*width, y: 0.60105*height), control1: CGPoint(x: -0.02113*width, y: 0.95646*height), control2: CGPoint(x: 0.11235*width, y: 0.82624*height))
        path.addCurve(to: CGPoint(x: 0.70675*width, y: 0.44751*height), control1: CGPoint(x: 0.45022*width, y: 0.31956*height), control2: CGPoint(x: 0.5691*width, y: 0.35368*height))
        path.addCurve(to: CGPoint(x: 1.1197*width, y: 0.48163*height), control1: CGPoint(x: 0.81687*width, y: 0.52257*height), control2: CGPoint(x: 1.02793*width, y: 0.50153*height))
        path.addLine(to: CGPoint(x: 1.04461*width, y: 0.14043*height))
        path.addCurve(to: CGPoint(x: 0.68798*width, y: 0.08925*height), control1: CGPoint(x: 0.99664*width, y: 0.15749*height), control2: CGPoint(x: 0.85816*width, y: 0.17114*height))
        path.addCurve(to: CGPoint(x: 0.15614*width, y: 0.3025*height), control1: CGPoint(x: 0.47524*width, y: -0.01311*height), control2: CGPoint(x: 0.35636*width, y: -0.10694*height))
        path.closeSubpath()
        return path
    }
}

struct Facemask: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.97316*width, y: 0.29131*height))
        path.addCurve(to: CGPoint(x: 0.9118*width, y: 0.12622*height), control1: CGPoint(x: 0.96573*width, y: 0.21987*height), control2: CGPoint(x: 0.93148*width, y: 0.16604*height))
        path.addCurve(to: CGPoint(x: 0.63056*width, y: 0.00556*height), control1: CGPoint(x: 0.81371*width, y: -0.03527*height), control2: CGPoint(x: 0.63056*width, y: 0.00556*height))
        path.addCurve(to: CGPoint(x: 0.51899*width, y: 0.02537*height), control1: CGPoint(x: 0.63056*width, y: 0.00556*height), control2: CGPoint(x: 0.57012*width, y: 0.02537*height))
        path.addCurve(to: CGPoint(x: 0.36233*width, y: 0.06559*height), control1: CGPoint(x: 0.47932*width, y: 0.02537*height), control2: CGPoint(x: 0.42648*width, y: 0.03917*height))
        path.addCurve(to: CGPoint(x: 0.23914*width, y: 0.05238*height), control1: CGPoint(x: 0.32102*width, y: 0.0826*height), control2: CGPoint(x: 0.29911*width, y: 0.06859*height))
        path.addCurve(to: CGPoint(x: 0.09596*width, y: 0.0854*height), control1: CGPoint(x: 0.19539*width, y: 0.04056*height), control2: CGPoint(x: 0.13408*width, y: 0.04578*height))
        path.addCurve(to: CGPoint(x: 0.04669*width, y: 0.17725*height), control1: CGPoint(x: 0.05784*width, y: 0.12502*height), control2: CGPoint(x: 0.04669*width, y: 0.17725*height))
        path.addCurve(to: CGPoint(x: 0.03553*width, y: 0.25769*height), control1: CGPoint(x: 0.04669*width, y: 0.17725*height), control2: CGPoint(x: 0.03267*width, y: 0.22599*height))
        path.addCurve(to: CGPoint(x: 0.09596*width, y: 0.36815*height), control1: CGPoint(x: 0.04027*width, y: 0.31016*height), control2: CGPoint(x: 0.09596*width, y: 0.31533*height))
        path.addCurve(to: CGPoint(x: 0.11828*width, y: 0.46661*height), control1: CGPoint(x: 0.09596*width, y: 0.40898*height), control2: CGPoint(x: 0.09596*width, y: 0.43959*height))
        path.addCurve(to: CGPoint(x: 0.09596*width, y: 0.57707*height), control1: CGPoint(x: 0.14346*width, y: 0.4971*height), control2: CGPoint(x: 0.13408*width, y: 0.54585*height))
        path.addCurve(to: CGPoint(x: 0.01322*width, y: 0.65511*height), control1: CGPoint(x: 0.05106*width, y: 0.61384*height), control2: CGPoint(x: 0.0267*width, y: 0.62569*height))
        path.addCurve(to: CGPoint(x: 0.03599*width, y: 0.80699*height), control1: CGPoint(x: -0.005*width, y: 0.69485*height), control2: CGPoint(x: -0.00538*width, y: 0.76557*height))
        path.addCurve(to: CGPoint(x: 0.05598*width, y: 0.88083*height), control1: CGPoint(x: 0.05379*width, y: 0.82481*height), control2: CGPoint(x: 0.04297*width, y: 0.86475*height))
        path.addCurve(to: CGPoint(x: 0.21078*width, y: 0.96668*height), control1: CGPoint(x: 0.09694*width, y: 0.93144*height), control2: CGPoint(x: 0.14803*width, y: 0.90124*height))
        path.addCurve(to: CGPoint(x: 0.40835*width, y: 0.95887*height), control1: CGPoint(x: 0.27084*width, y: 1.0293*height), control2: CGPoint(x: 0.35482*width, y: 0.98298*height))
        path.addCurve(to: CGPoint(x: 0.68169*width, y: 0.93906*height), control1: CGPoint(x: 0.54967*width, y: 0.89524*height), control2: CGPoint(x: 0.68169*width, y: 0.93906*height))
        path.addCurve(to: CGPoint(x: 0.6789*width, y: 0.83941*height), control1: CGPoint(x: 0.68061*width, y: 0.92685*height), control2: CGPoint(x: 0.67382*width, y: 0.89007*height))
        path.addCurve(to: CGPoint(x: 0.75886*width, y: 0.75236*height), control1: CGPoint(x: 0.68541*width, y: 0.77457*height), control2: CGPoint(x: 0.73608*width, y: 0.74816*height))
        path.addCurve(to: CGPoint(x: 0.86113*width, y: 0.816*height), control1: CGPoint(x: 0.78164*width, y: 0.75656*height), control2: CGPoint(x: 0.8444*width, y: 0.80879*height))
        path.addCurve(to: CGPoint(x: 0.91459*width, y: 0.8184*height), control1: CGPoint(x: 0.87787*width, y: 0.8232*height), control2: CGPoint(x: 0.90111*width, y: 0.825*height))
        path.addCurve(to: CGPoint(x: 0.92342*width, y: 0.76497*height), control1: CGPoint(x: 0.92813*width, y: 0.81177*height), control2: CGPoint(x: 0.92482*width, y: 0.77757*height))
        path.addCurve(to: CGPoint(x: 0.92621*width, y: 0.73495*height), control1: CGPoint(x: 0.92203*width, y: 0.75236*height), control2: CGPoint(x: 0.92482*width, y: 0.73915*height))
        path.addCurve(to: CGPoint(x: 0.94202*width, y: 0.72895*height), control1: CGPoint(x: 0.92761*width, y: 0.73075*height), control2: CGPoint(x: 0.93706*width, y: 0.73069*height))
        path.addCurve(to: CGPoint(x: 0.94574*width, y: 0.70794*height), control1: CGPoint(x: 0.94713*width, y: 0.72715*height), control2: CGPoint(x: 0.94667*width, y: 0.71214*height))
        path.addCurve(to: CGPoint(x: 0.94016*width, y: 0.70013*height), control1: CGPoint(x: 0.94499*width, y: 0.70457*height), control2: CGPoint(x: 0.94171*width, y: 0.70133*height))
        path.addCurve(to: CGPoint(x: 0.95922*width, y: 0.67972*height), control1: CGPoint(x: 0.94481*width, y: 0.69533*height), control2: CGPoint(x: 0.95513*width, y: 0.68452*height))
        path.addCurve(to: CGPoint(x: 0.95782*width, y: 0.65811*height), control1: CGPoint(x: 0.96433*width, y: 0.67372*height), control2: CGPoint(x: 0.96015*width, y: 0.66892*height))
        path.addCurve(to: CGPoint(x: 0.96944*width, y: 0.6353*height), control1: CGPoint(x: 0.9555*width, y: 0.6473*height), control2: CGPoint(x: 0.96405*width, y: 0.63722*height))
        path.addCurve(to: CGPoint(x: 0.99734*width, y: 0.60888*height), control1: CGPoint(x: 0.98293*width, y: 0.6305*height), control2: CGPoint(x: 0.99408*width, y: 0.62089*height))
        path.addCurve(to: CGPoint(x: 0.9899*width, y: 0.58007*height), control1: CGPoint(x: 1.00059*width, y: 0.59688*height), control2: CGPoint(x: 0.99269*width, y: 0.58367*height))
        path.addCurve(to: CGPoint(x: 0.96944*width, y: 0.54105*height), control1: CGPoint(x: 0.98711*width, y: 0.57647*height), control2: CGPoint(x: 0.97642*width, y: 0.55605*height))
        path.addCurve(to: CGPoint(x: 0.95782*width, y: 0.48221*height), control1: CGPoint(x: 0.96313*width, y: 0.52746*height), control2: CGPoint(x: 0.95643*width, y: 0.49002*height))
        path.addCurve(to: CGPoint(x: 0.97316*width, y: 0.42458*height), control1: CGPoint(x: 0.95922*width, y: 0.47441*height), control2: CGPoint(x: 0.96991*width, y: 0.4504*height))
        path.addCurve(to: CGPoint(x: 0.97316*width, y: 0.29131*height), control1: CGPoint(x: 0.97642*width, y: 0.39877*height), control2: CGPoint(x: 0.97788*width, y: 0.33663*height))
        path.closeSubpath()
        return path
    }
}

struct Shape1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.12212*width, y: 0.84161*height))
        path.addCurve(to: CGPoint(x: 0.21379*width, y: 0.8868*height), control1: CGPoint(x: 0.15299*width, y: 0.85387*height), control2: CGPoint(x: 0.18357*width, y: 0.87043*height))
        path.addCurve(to: CGPoint(x: 0.37888*width, y: 0.94723*height), control1: CGPoint(x: 0.27019*width, y: 0.91735*height), control2: CGPoint(x: 0.32535*width, y: 0.94723*height))
        path.addCurve(to: CGPoint(x: 0.54246*width, y: 0.88078*height), control1: CGPoint(x: 0.44913*width, y: 0.94723*height), control2: CGPoint(x: 0.49693*width, y: 0.9132*height))
        path.addCurve(to: CGPoint(x: 0.70868*width, y: 0.82661*height), control1: CGPoint(x: 0.59193*width, y: 0.84556*height), control2: CGPoint(x: 0.63871*width, y: 0.81225*height))
        path.addCurve(to: CGPoint(x: 0.87934*width, y: 0.91347*height), control1: CGPoint(x: 0.78056*width, y: 0.84136*height), control2: CGPoint(x: 0.82914*width, y: 0.87682*height))
        path.addCurve(to: CGPoint(x: 1.03034*width, y: 0.99893*height), control1: CGPoint(x: 0.92299*width, y: 0.94533*height), control2: CGPoint(x: 0.96786*width, y: 0.97809*height))
        path.addCurve(to: CGPoint(x: 1.11632*width, y: -0.03584*height), control1: CGPoint(x: 1.10928*width, y: 1.02525*height), control2: CGPoint(x: 1.12278*width, y: 0.30819*height))
        path.addCurve(to: CGPoint(x: 1.11648*width, y: -0.02729*height), control1: CGPoint(x: 1.11638*width, y: -0.03299*height), control2: CGPoint(x: 1.11643*width, y: -0.03014*height))
        path.addCurve(to: CGPoint(x: 0.31577*width, y: 0.26656*height), control1: CGPoint(x: 0.89768*width, y: -0.01025*height), control2: CGPoint(x: 0.4546*width, y: 0.2947*height))
        path.addCurve(to: CGPoint(x: 0.04094*width, y: 0.4182*height), control1: CGPoint(x: 0.08813*width, y: 0.22043*height), control2: CGPoint(x: -0.07524*width, y: 0.27862*height))
        path.addCurve(to: CGPoint(x: 0.19273*width, y: 0.52996*height), control1: CGPoint(x: 0.07343*width, y: 0.45723*height), control2: CGPoint(x: 0.13542*width, y: 0.49502*height))
        path.addCurve(to: CGPoint(x: 0.31374*width, y: 0.61982*height), control1: CGPoint(x: 0.24677*width, y: 0.56289*height), control2: CGPoint(x: 0.29664*width, y: 0.59329*height))
        path.addCurve(to: CGPoint(x: 0.12212*width, y: 0.84161*height), control1: CGPoint(x: 0.37974*width, y: 0.72224*height), control2: CGPoint(x: 0.28684*width, y: 0.80515*height))
        path.closeSubpath()
        return path
    }
}

struct Shape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.02981*width, y: 0.06078*height))
        path.addCurve(to: CGPoint(x: 1.02719*width, y: -0.04563*height), control1: CGPoint(x: 1.02897*width, y: 0.02338*height), control2: CGPoint(x: 1.02809*width, y: -0.01225*height))
        path.addLine(to: CGPoint(x: -0.75654*width, y: 0.02261*height))
        path.addCurve(to: CGPoint(x: -0.75692*width, y: 0.06221*height), control1: CGPoint(x: -0.75719*width, y: 0.03314*height), control2: CGPoint(x: -0.75742*width, y: 0.0466*height))
        path.addCurve(to: CGPoint(x: -0.38494*width, y: 0.55445*height), control1: CGPoint(x: -0.64134*width, y: 0.26992*height), control2: CGPoint(x: -0.53956*width, y: 0.38685*height))
        path.addCurve(to: CGPoint(x: 0.10312*width, y: 0.96293*height), control1: CGPoint(x: -0.20507*width, y: 0.7494*height), control2: CGPoint(x: 0.0042*width, y: 0.91203*height))
        path.addCurve(to: CGPoint(x: 0.3452*width, y: 0.83339*height), control1: CGPoint(x: 0.20203*width, y: 1.01381*height), control2: CGPoint(x: 0.42069*width, y: 1.04157*height))
        path.addCurve(to: CGPoint(x: 0.28277*width, y: 0.6857*height), control1: CGPoint(x: 0.32495*width, y: 0.77754*height), control2: CGPoint(x: 0.3032*width, y: 0.73019*height))
        path.addCurve(to: CGPoint(x: 0.20203*width, y: 0.27128*height), control1: CGPoint(x: 0.22703*width, y: 0.56432*height), control2: CGPoint(x: 0.18108*width, y: 0.46425*height))
        path.addCurve(to: CGPoint(x: 0.42395*width, y: 0.06269*height), control1: CGPoint(x: 0.22282*width, y: 0.07982*height), control2: CGPoint(x: 0.35166*width, y: 0.06885*height))
        path.addCurve(to: CGPoint(x: 0.44411*width, y: 0.06078*height), control1: CGPoint(x: 0.43132*width, y: 0.06207*height), control2: CGPoint(x: 0.4381*width, y: 0.06149*height))
        path.addLine(to: CGPoint(x: 1.02981*width, y: 0.06078*height))
        path.closeSubpath()
        return path
    }
}
struct Shape3: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.06558*width, y: -0.05907*height))
        path.addCurve(to: CGPoint(x: 0.22747*width, y: -0.08535*height), control1: CGPoint(x: 1.03622*width, y: -0.10457*height), control2: CGPoint(x: 0.34309*width, y: -0.08337*height))
        path.addCurve(to: CGPoint(x: -0.03009*width, y: 0.77216*height), control1: CGPoint(x: -0.0672*width, y: 0.16619*height), control2: CGPoint(x: -0.09106*width, y: 0.5568*height))
        path.addCurve(to: CGPoint(x: 0.16873*width, y: 0.9946*height), control1: CGPoint(x: -0.00256*width, y: 0.86939*height), control2: CGPoint(x: 0.07554*width, y: 0.97283*height))
        path.addCurve(to: CGPoint(x: 0.42955*width, y: 0.85808*height), control1: CGPoint(x: 0.28313*width, y: 1.02145*height), control2: CGPoint(x: 0.38387*width, y: 0.90924*height))
        path.addCurve(to: CGPoint(x: 0.64836*width, y: 0.52712*height), control1: CGPoint(x: 0.57066*width, y: 0.70037*height), control2: CGPoint(x: 0.56964*width, y: 0.53616*height))
        path.addCurve(to: CGPoint(x: 0.88858*width, y: 0.74079*height), control1: CGPoint(x: 0.73482*width, y: 0.51723*height), control2: CGPoint(x: 0.76459*width, y: 0.72977*height))
        path.addCurve(to: CGPoint(x: 1.02663*width, y: 0.66363*height), control1: CGPoint(x: 0.96525*width, y: 0.74758*height), control2: CGPoint(x: 1.0199*width, y: 0.67296*height))
        path.addCurve(to: CGPoint(x: 1.05498*width, y: 0.33267*height), control1: CGPoint(x: 1.09066*width, y: 0.57347*height), control2: CGPoint(x: 1.0976*width, y: 0.42113*height))
        path.addCurve(to: CGPoint(x: 0.93426*width, y: 0.20265*height), control1: CGPoint(x: 1.01317*width, y: 0.2459*height), control2: CGPoint(x: 0.9312*width, y: 0.236*height))
        path.addCurve(to: CGPoint(x: 1.06375*width, y: 0.11927*height), control1: CGPoint(x: 0.93691*width, y: 0.171*height), control2: CGPoint(x: 1.02296*width, y: 0.19135*height))
        path.addCurve(to: CGPoint(x: 1.06558*width, y: -0.05907*height), control1: CGPoint(x: 1.09087*width, y: 0.07038*height), control2: CGPoint(x: 1.09352*width, y: -0.01611*height))
        path.closeSubpath()
        return path
    }
}

struct Shape4: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.91635*width, y: 0.09537*height))
        path.addCurve(to: CGPoint(x: 0.0638*width, y: 0.07381*height), control1: CGPoint(x: 0.88648*width, y: 0.05805*height), control2: CGPoint(x: 0.18141*width, y: 0.07543*height))
        path.addCurve(to: CGPoint(x: -0.19819*width, y: 0.77715*height), control1: CGPoint(x: -0.23594*width, y: 0.28013*height), control2: CGPoint(x: -0.26021*width, y: 0.60051*height))
        path.addCurve(to: CGPoint(x: 0.00406*width, y: 0.9596*height), control1: CGPoint(x: -0.17019*width, y: 0.8569*height), control2: CGPoint(x: -0.09074*width, y: 0.94175*height))
        path.addCurve(to: CGPoint(x: 0.26936*width, y: 0.84763*height), control1: CGPoint(x: 0.12043*width, y: 0.98162*height), control2: CGPoint(x: 0.2229*width, y: 0.88959*height))
        path.addCurve(to: CGPoint(x: 0.49194*width, y: 0.57617*height), control1: CGPoint(x: 0.41291*width, y: 0.71827*height), control2: CGPoint(x: 0.41187*width, y: 0.58358*height))
        path.addCurve(to: CGPoint(x: 0.7363*width, y: 0.75142*height), control1: CGPoint(x: 0.57989*width, y: 0.56805*height), control2: CGPoint(x: 0.61018*width, y: 0.74238*height))
        path.addCurve(to: CGPoint(x: 0.87673*width, y: 0.68814*height), control1: CGPoint(x: 0.81429*width, y: 0.75699*height), control2: CGPoint(x: 0.86988*width, y: 0.69579*height))
        path.addCurve(to: CGPoint(x: 0.90556*width, y: 0.41667*height), control1: CGPoint(x: 0.94186*width, y: 0.61418*height), control2: CGPoint(x: 0.94892*width, y: 0.48923*height))
        path.addCurve(to: CGPoint(x: 0.78276*width, y: 0.31003*height), control1: CGPoint(x: 0.86304*width, y: 0.3455*height), control2: CGPoint(x: 0.77965*width, y: 0.33739*height))
        path.addCurve(to: CGPoint(x: 0.91448*width, y: 0.24165*height), control1: CGPoint(x: 0.78546*width, y: 0.28407*height), control2: CGPoint(x: 0.873*width, y: 0.30076*height))
        path.addCurve(to: CGPoint(x: 0.91635*width, y: 0.09537*height), control1: CGPoint(x: 0.94207*width, y: 0.20154*height), control2: CGPoint(x: 0.94477*width, y: 0.1306*height))
        path.closeSubpath()
        return path
    }
}
struct Shape5: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.05716*width, y: 0.99774*height))
        path.addCurve(to: CGPoint(x: 0.18118*width, y: 0.97489*height), control1: CGPoint(x: 0.12942*width, y: 0.99762*height), control2: CGPoint(x: 0.14079*width, y: 0.9976*height))
        path.addCurve(to: CGPoint(x: 0.30368*width, y: 0.72178*height), control1: CGPoint(x: 0.28649*width, y: 0.93329*height), control2: CGPoint(x: 0.34588*width, y: 0.83867*height))
        path.addCurve(to: CGPoint(x: 0.22632*width, y: 0.61923*height), control1: CGPoint(x: 0.29275*width, y: 0.69151*height), control2: CGPoint(x: 0.26087*width, y: 0.65682*height))
        path.addCurve(to: CGPoint(x: 0.12928*width, y: 0.4917*height), control1: CGPoint(x: 0.18968*width, y: 0.57936*height), control2: CGPoint(x: 0.15005*width, y: 0.53624*height))
        path.addCurve(to: CGPoint(x: 0.30498*width, y: 0.31864*height), control1: CGPoint(x: 0.055*width, y: 0.3324*height), control2: CGPoint(x: 0.15945*width, y: 0.26599*height))
        path.addCurve(to: CGPoint(x: 0.68043*width, y: 0.46832*height), control1: CGPoint(x: 0.35619*width, y: 0.33716*height), control2: CGPoint(x: 0.51231*width, y: 0.48139*height))
        path.addCurve(to: CGPoint(x: 1.00704*width, y: 0.31186*height), control1: CGPoint(x: 0.80375*width, y: 0.45872*height), control2: CGPoint(x: 0.94208*width, y: 0.28617*height))
        path.addCurve(to: CGPoint(x: 1.00705*width, y: 0.00268*height), control1: CGPoint(x: 1.00596*width, y: 0.20342*height), control2: CGPoint(x: 1.0095*width, y: 0.0958*height))
        path.addLine(to: CGPoint(x: 0.22559*width, y: 0.06496*height))
        path.addCurve(to: CGPoint(x: 0.20543*width, y: 0.06659*height), control1: CGPoint(x: 0.21957*width, y: 0.06556*height), control2: CGPoint(x: 0.2128*width, y: 0.06605*height))
        path.addCurve(to: CGPoint(x: -0.01649*width, y: 0.24391*height), control1: CGPoint(x: 0.13314*width, y: 0.07182*height), control2: CGPoint(x: 0.0043*width, y: 0.08114*height))
        path.addCurve(to: CGPoint(x: 0.06425*width, y: 0.59623*height), control1: CGPoint(x: -0.03744*width, y: 0.40797*height), control2: CGPoint(x: 0.00851*width, y: 0.49304*height))
        path.addCurve(to: CGPoint(x: 0.12668*width, y: 0.72178*height), control1: CGPoint(x: 0.08468*width, y: 0.63405*height), control2: CGPoint(x: 0.10643*width, y: 0.67431*height))
        path.addCurve(to: CGPoint(x: -0.18048*width, y: 0.83978*height), control1: CGPoint(x: 0.20217*width, y: 0.89878*height), control2: CGPoint(x: -0.08156*width, y: 0.88304*height))
        path.addLine(to: CGPoint(x: -0.18048*width, y: 0.98488*height))
        path.addCurve(to: CGPoint(x: 0.05581*width, y: 0.99774*height), control1: CGPoint(x: -0.09826*width, y: 1.00229*height), control2: CGPoint(x: -0.01602*width, y: 0.99786*height))
        path.addLine(to: CGPoint(x: 0.05716*width, y: 0.99774*height))
        path.closeSubpath()
        return path
    }
}
struct Shape6: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.89742*width, y: 0.09923*height))
        path.addCurve(to: CGPoint(x: 0.68407*width, y: 0.11403*height), control1: CGPoint(x: 1.49868*width, y: 0.21915*height), control2: CGPoint(x: 1.26887*width, y: 0.36309*height))
        path.addCurve(to: CGPoint(x: 0.16711*width, y: 0.37918*height), control1: CGPoint(x: 0.06588*width, y: -0.14925*height), control2: CGPoint(x: -0.17487*width, y: 0.10946*height))
        path.addCurve(to: CGPoint(x: 0.65243*width, y: 0.90796*height), control1: CGPoint(x: 0.45951*width, y: 0.60979*height), control2: CGPoint(x: 0.65243*width, y: 0.73207*height))
        path.addCurve(to: CGPoint(x: 0.64073*width, y: 0.99658*height), control1: CGPoint(x: 0.65243*width, y: 0.93845*height), control2: CGPoint(x: 0.64847*width, y: 0.968*height))
        return path
    }
}

struct Shape7: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.89742*width, y: 0.09923*height))
        path.addCurve(to: CGPoint(x: 0.68407*width, y: 0.11403*height), control1: CGPoint(x: 1.49868*width, y: 0.21915*height), control2: CGPoint(x: 1.26887*width, y: 0.36309*height))
        path.addCurve(to: CGPoint(x: 0.16711*width, y: 0.37918*height), control1: CGPoint(x: 0.06588*width, y: -0.14925*height), control2: CGPoint(x: -0.17487*width, y: 0.10946*height))
        path.addCurve(to: CGPoint(x: 0.65243*width, y: 0.90796*height), control1: CGPoint(x: 0.45951*width, y: 0.60979*height), control2: CGPoint(x: 0.65243*width, y: 0.73207*height))
        path.addCurve(to: CGPoint(x: 0.64073*width, y: 0.99658*height), control1: CGPoint(x: 0.65243*width, y: 0.93845*height), control2: CGPoint(x: 0.64847*width, y: 0.968*height))
        return path
    }
}
