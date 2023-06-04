//
//  AboutView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 19/04/2023.
//

import SwiftUI
import SwiftUIX


struct AboutView: View {
    
    let defaultURL = URL(string: "https://google.com")!
    let twitterURL = URL(string: "https://twitte.com/misterallhands")!
    let githubURL = URL(string: "https://github.com/misterallhands")!
    let instagramURL = URL(string: "https://instagram.com/prins_alif")!
    let portfolioURL = URL(string: "https://github.com/misterallhands")!
    
    @State var selection = 0

    var body: some View {
        NavigationView {
            ZStack {
                background
                tapView
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    menuButton
                }
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}


extension AboutView {
    
    private var DeveloperPage: some View{
        
        VStack(spacing: 0, content: {
            Image("me3")
                .resizable()
                .frame(width: 120, height: 120)
                .border( LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.03333336114883423, green: 0.5024509429931641, blue: 1, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7562500238418579, blue: 1, alpha: 1)), location: 0.5629924535751343),
                        .init(color: Color(#colorLiteral(red: 1, green: 0.6083333492279053, blue: 0.8732843995094299, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 1.0125392039427847, y: 1.0175438863216821),
                    endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0)), width: 3, cornerRadius: 60)
            
            BuildCard(for: "Developer", headerTitle: "About Developer", text: "This App was built by Ramazon Odinaev through tons of research and expertice. It's build 100% purely in SwiftUI and utilizes the core aspects of SwiftUI technology. I implemented multi-threading, publishers/subscribers,and data persistance.")
        })
    }
    
    private var AboutPage: some View {
        
        BuildCard(for: "Crypto Mall", headerTitle: "About the App", text: "The app fethces crypto data from internet and presents it in nice and consise way to user. The App comes with pretty decent feauteres allowing users to search for coins, add them to their portfolio, filter them based on their own prefernce and many more. The app uses MVVM Architecture, Combine and Core Data.")
        
    }
    
    private var Socials: some View {

            VStack {
                VStack(alignment: .leading, spacing: -20) {
                    Text("Me on social media")
                        .font(.custom("Kanit-SemiBold", size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.7))
                    
                    LinearGradient(
                                gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0.03333336114883423, green: 0.5024509429931641, blue: 1, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7562500238418579, blue: 1, alpha: 1)), location: 0.5629924535751343),
                            .init(color: Color(#colorLiteral(red: 1, green: 0.6083333492279053, blue: 0.8732843995094299, alpha: 1)), location: 1)]),
                                startPoint: UnitPoint(x: 1.0125392039427847, y: 1.0175438863216821),
                                endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0))
                        .frame(height: 140)
                        .mask{
                                Text("Find me on")
                                    .font(.custom("Kanit-Bold", size: 40))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 50 ,content: {
                            Link(destination: twitterURL){
                                HStack {
                                    Image("twitter")
                                    Text(" Twitter")
                                        .foregroundColor(.blue)
                                        .fontWeight(.semibold)
                                }
                            }
                            Link(destination: instagramURL){
                                HStack(spacing: 10) {
                                    Image("instagram2")
                                    Text("Instagram")
                                        .foregroundColor(.pink)
                                        .fontWeight(.semibold)
                                }
                            }
                        })
                        HStack(spacing: 50, content: {
                            Link(destination: githubURL){
                                HStack(spacing: 10) {
                                    Image("github")
                                    Text("GitHub")
                                        .fontWeight(.bold)
                                }
                            }
                            
                            Link(destination: portfolioURL){
                                HStack(spacing: 10) {
                                    Image("website")
                                    Text(" Website")
                                        .foregroundColor(.blue)
                                        .fontWeight(.semibold)
                                }
                            }
                        })
                    }
                    .font(.custom("Kanit-ExtraLight", size: 20))
                }
                .padding(20)
                .background(
                    LinearGradient(
                                gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 1)]),
                                startPoint: UnitPoint(x: 0.49999988837676157, y: 2.9497591284275417e-15),
                                endPoint: UnitPoint(x: 0.4999999443689973, y: 0.9363635917143408))
                )
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .overlay({
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.800000011920929)), location: 0),
                                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5,
                                                  y: -3.06161911669639e-17),
                            endPoint: UnitPoint(x: 0.5000000000000001,
                                                y: 0.49999999999999994)), lineWidth: 1)
                        .blendMode(.overlay)
                        .overlay {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .stroke(LinearGradient(
                                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.800000011920929)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                                    startPoint: UnitPoint(x: 0.5,
                                                          y: -3.06161911669639e-17),
                                    endPoint: UnitPoint(x: 0.5000000000000001,
                                                        y: 0.49999999999999994)), lineWidth: 2)
                                .blur(radius: 10)
                        }
                })
                .background(
                    VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark)
                        .mask(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.blue.opacity(0)]), startPoint: .top, endPoint: .bottom))
                        )
                )
            .padding(20)
            .padding(.bottom, 60)
        }
    }
    
    private var tapView: some View{
        TabView(selection: $selection) {
            AboutPage.tag(0)
            DeveloperPage.tag(1)
            Socials.tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(
            ZStack {
                FaceGraphic(selection: $selection)
                Blob1Graphic(selection: $selection)
                Blob2Graphic(selection: $selection)
            }
        )
    }
    
    private var background: some View {
           ZStack {
                LinearGradient(
                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 0.8458333611488342, green: 0.39472222328186035, blue: 0.5841889381408691, alpha: 1)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 0.28703832626342773, green: 0.11713546514511108, blue: 0.7208333611488342, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5000000291053439, y: 1.0838161507153998e-8),
                    endPoint: UnitPoint(x: -0.002089660354856915, y: 0.976613295904758))
                .ignoresSafeArea()
                .overlay(
                    ZStack(content: {
                        Wave()
                        Wave1()
                    })
                )
           }
    }
    
    private var menuButton: some View{
    VStack{
        Button(action: {
            withAnimation(.spring()){
            }
        }, label: {
            VStack(spacing: 6) {
                Capsule()
                    .fill(.white)
                    .frame(width: 30, height: 3)
                VStack(spacing: 6) {
                    Capsule()
                        .fill(.white)
                        .frame(width: 30, height: 3)
                    Capsule()
                        .fill(.white)
                        .frame(width: 30, height: 3)
                }
            }
        })
        .padding()
        .padding([.leading], 7)
        .padding(.top, -5)
    }
}
    
    private func BuildCard(for sectionTitle: String, headerTitle: String , text: String ) -> some View {
        VStack {
            VStack(alignment: .leading, spacing: -20) {
                Text(headerTitle)
                    .font(.custom("Kanit-SemiBold", size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
                
                LinearGradient(
                            gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.03333336114883423, green: 0.5024509429931641, blue: 1, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7562500238418579, blue: 1, alpha: 1)), location: 0.5629924535751343),
                        .init(color: Color(#colorLiteral(red: 1, green: 0.6083333492279053, blue: 0.8732843995094299, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 1.0125392039427847, y: 1.0175438863216821),
                            endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0))
                    .frame(height: 140)
                    .mask{
                            Text(sectionTitle)
                                .font(.custom("Kanit-Bold", size: 40))
                                .frame(maxWidth: .infinity, alignment: .leading)
                    }
                
                Text(text)
                    .font(.custom("Kanit-ExtraLight", size: 16))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(20)
            .background(
                LinearGradient(
                            gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 1)]),
                            startPoint: UnitPoint(x: 0.49999988837676157, y: 2.9497591284275417e-15),
                            endPoint: UnitPoint(x: 0.4999999443689973, y: 0.9363635917143408))
            )
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay({
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.800000011920929)), location: 0),
                            .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5,
                                              y: -3.06161911669639e-17),
                        endPoint: UnitPoint(x: 0.5000000000000001,
                                            y: 0.49999999999999994)), lineWidth: 1)
                    .blendMode(.overlay)
                    .overlay {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.800000011920929)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                                startPoint: UnitPoint(x: 0.5,
                                                      y: -3.06161911669639e-17),
                                endPoint: UnitPoint(x: 0.5000000000000001,
                                                    y: 0.49999999999999994)), lineWidth: 2)
                            .blur(radius: 10)
                    }
            })
            .background(
                VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark)
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.blue.opacity(0)]), startPoint: .top, endPoint: .bottom))
                    )
            )
        .padding(20)
        .padding(.bottom, 60)
    }
        .background(
            LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)).opacity(0), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.49999988837676157, y: 2.9497591284275417e-15),
                        endPoint: UnitPoint(x: 0.4999999443689973, y: 0.9363635917143408))
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .overlay({
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 0),
                        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.800000011920929)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5,
                                          y: -3.06161911669639e-17),
                    endPoint: UnitPoint(x: 0.5000000000000001,
                                        y: 0.49999999999999994)), lineWidth: 1)
                .blendMode(.overlay)
                .overlay {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 0),
                                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.800000011920929)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5,
                                                  y: -3.06161911669639e-17),
                            endPoint: UnitPoint(x: 0.5000000000000001,
                                                y: 0.49999999999999994)), lineWidth: 2)
                        .blur(radius: 10)
                }
        })
        .background(
            VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .blur(radius: 10)
        )
        .padding(15)
    }
}
