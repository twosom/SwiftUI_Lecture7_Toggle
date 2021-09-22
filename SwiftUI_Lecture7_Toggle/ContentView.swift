//
//  ContentView.swift
//  SwiftUI_Lecture7_Toggle
//
//  Created by Desire L on 2021/09/22.
//
//

import SwiftUI

struct ContentView: View {

    @State
    private var isOn: Bool = false

    var body: some View {
        VStack {
            MyToggle(isOn: $isOn)
            Text("\(isOn.description)")

        }


                .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}

struct MyToggle: View {

    //TODO @Binding 이라는 것은 값을 가질 수 없다.
    // 원래 원본 값이 어딘가 있다는 뜻이기 때문에 스스로 값을 가지는 것이 안된다.
    // 따라서 타입만 지정할 수 있다.
    // Class 도 마찬가지지만, 값이 없고 Type 만 지정되어 있으면 Initializer 에 자동으로 붙는다.
    @Binding
    var isOn: Bool

    var body: some View {
        Toggle("toggle title : \(isOn.description)", isOn: $isOn)
        Toggle(isOn: $isOn) {
            HStack {
                Spacer()
                VStack {
                    Text("Hello")
                    Text("World!")
                }
            }
        }
    }
}


class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView())
    }
    #endif
}
