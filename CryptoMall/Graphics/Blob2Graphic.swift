//
//  Blob2Graphic.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 2021-04-08.
//

import SwiftUI

struct Blob2Graphic: View {
    @State var appear = false
    @Binding var selection: Int
    @State var active = true
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1647058824, green: 0.0431372549, blue: 0.4156862745, alpha: 1)), Color(#colorLiteral(red: 0.2862745098, green: 0.1490196078, blue: 0.6784313725, alpha: 1))]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            AngularGradient(
                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.33725491166114807, green: 0.10588235408067703, blue: 0.7450980544090271, alpha: 1)), location: 0.07859717309474945),
                                    .init(color: Color(#colorLiteral(red: 0.5387900472, green: 0.7564365268, blue: 0.9927431941, alpha: 1)), location: 0.43838635087013245),
                                    .init(color: Color(#colorLiteral(red: 0.337254902, green: 0.1058823529, blue: 0.7450980392, alpha: 1)), location: 0.6134116053581238),
                                    .init(color: Color(#colorLiteral(red: 0.9791666269302368, green: 0.5303819179534912, blue: 0.5715969204902649, alpha: 1)), location: 0.8473764657974243)]),
                center: UnitPoint(x: 0.46496582610273096, y: 0.574173996657284)
            )
            .frame(width: 680, height: 419)
            .mask(BoomerangBG())
            .blur(radius: 50)
            .offset(x: 180, y: -125)
            
            LinearGradient(
                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.7490196228027344, green: 0.46666666865348816, blue: 0.6941176652908325, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.9529411792755127, green: 0.7411764860153198, blue: 0.929411768913269, alpha: 1)), location: 0.5946641564369202),
                                    .init(color: Color(#colorLiteral(red: 0.5764706134796143, green: 0.5921568870544434, blue: 0.9411764740943909, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 0.36582115794762665, y: -0.09165190064186535),
                endPoint: UnitPoint(x: 0.6463251557716347, y: 1.2445408193695318))
                .overlay(
                    Ellipse()
                        .fill(LinearGradient(             gradient: Gradient(stops: [         .init(color: Color(#colorLiteral(red: 0.1882352978, green: 0.09019608051, blue: 0.4862745106, alpha: 0.905683808)), location: 0),          .init(color: Color(#colorLiteral(red: 0.7867753506, green: 0.7250000238, blue: 1, alpha: 0.8957966179)), location: 1)]),             startPoint: UnitPoint(x: 0.5806451637435404, y: 0.29166667923153416),             endPoint: UnitPoint(x: 0.873900280182027, y: 1.069444474284321)))
                        .blur(radius: 50)
                        .frame(width: 325.5, height: 137.6)
                        .offset(x: 100, y: -10))
                .overlay(
                    BoomerangRight()
                        .fill(AngularGradient(
                            gradient: Gradient(stops: [
                                                .init(color: Color(#colorLiteral(red: 0.33725491166114807, green: 0.10588235408067703, blue: 0.7450980544090271, alpha: 1)), location: 0.07859717309474945),
                                                .init(color: Color(#colorLiteral(red: 0.43921568989753723, green: 0.9019607901573181, blue: 0.9843137264251709, alpha: 1)), location: 0.43838635087013245),
                                                .init(color: Color(#colorLiteral(red: 0.2078431373, green: 0.2431372549, blue: 0.8431372549, alpha: 1)), location: 0.6134116053581238),
                                                .init(color: Color(#colorLiteral(red: 0.337254902, green: 0.1058823529, blue: 0.7450980392, alpha: 1)), location: 0.8473764657974243)]),
                            center: UnitPoint(x: 0.4649657964986298, y: 0.5741739036770651)
                        ))
                        .blur(radius: 20)
                        .frame(width: 242.49, height: 159.05)
                        .offset(x:170, y: -70))
                .overlay(
                    BoomerangLeft()
                        .fill(AngularGradient(
                            gradient: Gradient(stops: [
                                                .init(color: Color(#colorLiteral(red: 0.337254902, green: 0.1058823529, blue: 0.7450980392, alpha: 1)), location: 0.07859717309474945),
                                                .init(color: Color(#colorLiteral(red: 0.6222767234, green: 0.2960603833, blue: 0.6663027406, alpha: 1)), location: 0.1905764490365982),
                                                .init(color: Color(#colorLiteral(red: 0.9107919931, green: 0.6561841369, blue: 0.6367964745, alpha: 1)), location: 0.43838635087013245),
                                                .init(color: Color(#colorLiteral(red: 0.9839649796, green: 0.8629427552, blue: 0.6713833213, alpha: 1)), location: 0.6134116053581238),
                                                .init(color: Color(#colorLiteral(red: 0.4392156863, green: 0.9019607843, blue: 0.9843137255, alpha: 1)), location: 0.8473764657974243),
                                                .init(color: Color(#colorLiteral(red: 0.4792864918708801, green: 0.19980859756469727, blue: 0.7067086100578308, alpha: 1)), location: 0.9983987808227539)]),
                            center: UnitPoint(x: 0.5350344418500974, y: 0.42582605855481737)
                        ))
                        .blur(radius: 20)
                        .frame(width: 242.49, height: 159.05)
                        .offset(x:-240, y: -60))
                .overlay(
                    MaskBlur()
                        .fill(LinearGradient(
                                gradient: Gradient(stops: [
                                                    .init(color: Color(#colorLiteral(red: 0.8117647171, green: 0.3215686381, blue: 0.6274510026, alpha: 0.7)), location: 0),
                                                    .init(color: Color(#colorLiteral(red: 0.3511984944, green: 0.1639255881, blue: 0.6954550147, alpha: 0.2780383988)), location: 0.3487224578857422),
                                                    .init(color: Color(#colorLiteral(red: 0.2078431398, green: 0.2431372553, blue: 0.8431372643, alpha: 0.1799865319)), location: 0.35723942518234253),
                                                    .init(color: Color(#colorLiteral(red: 0.2823529541, green: 0.6000000238, blue: 0.8549019694, alpha: 0.7)), location: 0.7031797766685486),
                                                    .init(color: Color(#colorLiteral(red: 0.7098039389, green: 0.8156862855, blue: 0.5411764979, alpha: 0.7)), location: 1)]),
                                startPoint: UnitPoint(x: 0.571714050553041, y: 0.1938197972208766),
                                endPoint: UnitPoint(x: 0.33172430639035105, y: 1.284357474666985)))
                        .blur(radius: 20)
                        .frame(width: 440.5, height: 243.57)
                        .offset(x:0, y: -72))
                .mask(BigShape()
                        .frame(width: 350, height: 300)
                        .offset(x: 20, y: -120))
            
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9098039216, green: 0.2274509804, blue: 0.6509803922, alpha: 1)), Color(#colorLiteral(red: 0.937254902, green: 0.6431372549, blue: 0.6745098039, alpha: 1)), Color(#colorLiteral(red: 0.9725490196, green: 0.8705882353, blue: 0.3333333333, alpha: 1))]), center: .center, startRadius: 5, endRadius: 300)
                .frame(width: 375, height: 375, alignment: .center)
                .mask(Circle().frame(width: 375, height: 375))
                .scaleEffect(0.2)
                .offset(x: appear ? 160 : 0, y: -60)
            
            
            AngularGradient(
                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), location: 0.09038078784942627),
                                    .init(color: Color(#colorLiteral(red: 1, green: 0.4991061091, blue: 0.8264301419, alpha: 1)), location: 0.6674935817718506),
                                    .init(color: Color(#colorLiteral(red: 0.4619576931, green: 0.2237143517, blue: 0.9554843307, alpha: 1)), location: 0.8676615953445435),
                                    .init(color: Color(#colorLiteral(red: 0.33725491166114807, green: 0.10588235408067703, blue: 0.7450980544090271, alpha: 1)), location: 0.9962207078933716)]),
                center: UnitPoint(x: 0.23643176854594894, y: 1.0700318923415988))
                .frame(width: 42.4, height: 37.27, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .mask(BlobShapeTop())
                .offset(x: appear ? -90 : 0, y: -270)
            
            AngularGradient(
                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.33725491166114807, green: 0.10588235408067703, blue: 0.7450980544090271, alpha: 1)), location: 0.07859717309474945),
                                    .init(color: Color(#colorLiteral(red: 0.43921568989753723, green: 0.9019607901573181, blue: 0.9843137264251709, alpha: 1)), location: 0.43838635087013245),
                                    .init(color: Color(#colorLiteral(red: 0.9843137264251709, green: 0.9725490212440491, blue: 0.7019608020782471, alpha: 1)), location: 0.6134116053581238),
                                    .init(color: Color(#colorLiteral(red: 0.9791666269302368, green: 0.5303819179534912, blue: 0.5715969204902649, alpha: 1)), location: 0.8473764657974243)]),
                center: UnitPoint(x: 0.4618092920835134, y: 0.511450411134368)
            )
            .blur(radius: 20)
            .frame(width: 119.33, height: 119.4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .mask(MiddleGlob())
            .overlay(
                RadialGradient(
                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 0.5254902243614197, green: 0.15294118225574493, blue: 0.6431372761726379, alpha: 1)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 0.8627451062202454, green: 0.3921568691730499, blue: 0.529411792755127, alpha: 1)), location: 1)]),
                    center: UnitPoint(x: 0.20449714845584743, y: 0.5004239991789909),
                    startRadius: 1.5206400165393983,
                    endRadius: 151.28048071032234
                )
                .blur(radius: 30)
                .frame(width: 80, height: 87)
                .offset(x: -9, y: -2)
            )
            .offset(x: appear ? 30 : 0, y: appear ? -225 : -300)
        }
        .opacity(active ? 1 : 0)
        .onAppear(perform: {
            update()
        })
        .onChange(of: selection, perform: { value in
            update()
        })
    }
    
    func update() {
        if selection == 2 {
            withAnimation {
                active = true
            }
            withAnimation(.easeOut(duration: 10)) {
                appear = true
            }
        } else {
            withAnimation {
                active = false
                appear = false
            }
        }
    }
}

struct Blob2Graphic_Previews: PreviewProvider {
    static var previews: some View {
        Blob2Graphic(selection: .constant(2))
    }
}
