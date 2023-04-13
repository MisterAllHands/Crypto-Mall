import SwiftUI


struct RefreshableView<Content: View>: View {
    
    var content: Content
    var showIndicator: Bool
    var onRefresh: ()async-> ()
    init(showIndicator: Bool = false, @ViewBuilder content: @escaping()-> Content ,onRefresh: @escaping ()async -> ()) {
        self.showIndicator = showIndicator
        self.onRefresh = onRefresh
        self.content = content()
    }
    
    @StateObject var scrollDelegate: ScrollViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: showIndicator) {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.clear)
                    .frame(height: 150 * scrollDelegate.progress)
                
                content
            }
            .offset(coordinatorSpace: "SCROLL") {offset in
                
                //MARK: Storing Content Offset
                scrollDelegate.contentOffset = offset
                
                //MARK: Stopping the Progress when it's Eligable for Refresh
                if !scrollDelegate.isEligable{
                    var progress = offset / 150
                    progress = (progress < 0 ? 0 : progress )
                    progress = (progress > 1 ? 1 : progress )
                    scrollDelegate.scrollOffset = offset
                    scrollDelegate.progress = progress
                }
                
                if scrollDelegate.isEligable && !scrollDelegate.isRefreshing {
                    scrollDelegate.isRefreshing = true
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }
            }
        }
        .overlay(alignment: .top, content: {
            ZStack {
                Capsule()
                    .fill(.black)
            }
            .frame(width: 126, height: 37)
            .offset(y: -5)
            .frame(maxHeight: .infinity, alignment: .top)
            .overlay(alignment: .top, content: {
                Canvas{ context, size in
                    context.addFilter(.alphaThreshold(min: 0.5, color: .black))
                    context.addFilter(.blur(radius: 10))
                    context.drawLayer { ctx in
                        for index in [1,2]{
                            if let resolvedView = context.resolveSymbol(id: index){
                                ctx.draw(resolvedView, at: CGPoint(x: size.width / 2, y: 15))
                            }
                        }
                    }
                } symbols: {
                    CanvasSybol()
                        .tag(1)
                    CanvasSybol(isCircle: true)
                        .tag(2)
                }
                .allowsHitTesting(false)
            })
            .overlay(alignment: .top , content:{
                refereshView()
                //MARK: Dynamic Island top offset
                    .offset(y: 11)
            })
            .ignoresSafeArea()
        })
        .coordinateSpace(name: "SCROLL")
        .onAppear(perform: scrollDelegate.addGesture)
        .onDisappear(perform: scrollDelegate.removeGesture)
        .onChange(of: scrollDelegate.isRefreshing) { newValue in
            if newValue{
                Task {
                    try? await Task.sleep(nanoseconds: 2_000_000_000)
                    
                    await onRefresh()
                    
                    //MARK: - After refreshing done Resetting Properties
                    withAnimation(.easeInOut(duration: 0.25)){
                        scrollDelegate.progress = 0
                        scrollDelegate.isEligable = false
                        scrollDelegate.isRefreshing = false
                        scrollDelegate.contentOffset = 0
                    }
                }
            }
        }
    }
    
    @ViewBuilder

    func CanvasSybol(isCircle: Bool = false) -> some View{
        
        if isCircle{
            let centerOffset = scrollDelegate.isEligable ? (scrollDelegate.contentOffset > 95 ? scrollDelegate.contentOffset : 95) : scrollDelegate.scrollOffset
            let offset = scrollDelegate.scrollOffset > 0 ? centerOffset : 0
            
            let scaling = ((scrollDelegate.progress / 1) * 0.61)
           Circle()
                .fill(.black)
                .frame(width: 47, height: 47)
                .scaleEffect(0.80 + scaling, anchor: .center)
                .offset(y: offset)
        }else{
            Circle()
                .fill(.black)
                .frame(width: 126, height: 37)
        }
    }
    
    @ViewBuilder
    func refereshView() -> some View {
        
        let centerOffset = scrollDelegate.isEligable ? (scrollDelegate.contentOffset > 95 ? scrollDelegate.contentOffset : 95) : scrollDelegate.scrollOffset
        let offset = scrollDelegate.scrollOffset > 0 ? centerOffset : 0
        ZStack {
            Image(systemName: "arrow.down")
                .font(.callout.bold())
                .frame(width: 38, height: 38)
                .foregroundColor(.white)
                .rotationEffect(.init(degrees: scrollDelegate.progress * 180))
                .opacity(scrollDelegate.isEligable ? 0 : 1)
            
            ProgressView()
                .tint(.white)
                .frame(width: 38, height: 38)
                .opacity(scrollDelegate.isEligable ? 1 : 0)
        }
            .animation(.easeOut(duration: 0.25), value: scrollDelegate.isEligable)
            .opacity(scrollDelegate.progress)
            .offset(y: offset)
    }
}

struct RefreshableView_Previews: PreviewProvider {
    static var previews: some View {
        RefreshableView(showIndicator: false){
            
        } onRefresh: {
            print("Refreshing")
        }
    }
}

//MARK:  For Simolenious Pan Gesture
class ScrollViewModel: NSObject, ObservableObject, UIGestureRecognizerDelegate {
    
    //MARK: Properties
    @Published var isEligable: Bool = false
    @Published var isRefreshing: Bool = false
    @Published var scrollOffset: CGFloat = 0
    @Published var contentOffset: CGFloat = 0
    @Published var progress: CGFloat = 0
    
    func gestureRecognizer (_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizers: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func addGesture () {
        let gesture = UIGestureRecognizer(target: self, action: #selector(onGestureChange(gesture: )))
        gesture.delegate = self
        rootController().view.addGestureRecognizer(gesture)
    }
    
    //MARK: Removing when Leaving View
    func removeGesture(){
        rootController().view.gestureRecognizers?.removeAll()
    }
    
    //MARK: Finding Root Cintroller
    func rootController() -> UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else{
            return.init()
        }
        return root
    }
    
    
    @objc
    func onGestureChange(gesture: UIGestureRecognizer){
        if gesture.state == .cancelled || gesture.state == .ended{
            if !isRefreshing{
                if scrollOffset > 150{
                    isEligable = true
                }else{
                    isEligable = false
                }
            }
        }
    }
}

extension View {
    @ViewBuilder
    func offset(coordinatorSpace: String, offset: @escaping (CGFloat) ->()) -> some View{
        self
            .overlay{
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named(coordinatorSpace)).minY
                    Color.clear
                        .preference( key: OffsetKey.self, value: minY)
                        .onPreferenceChange(OffsetKey.self){ value in
                            offset(value)
                        }
                }
            }
    }
}

//MARK: Offset Preference Key
struct OffsetKey: PreferenceKey{
    
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
