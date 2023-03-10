//
//  ContentView.swift
//  LoginPage
//
//  Created by Akshatha on 10/03/23.
//

//
//  LoginJourney.swift
//  Test
//
//  Created by Akshatha on 27/12/22.
//

import Foundation
import UIKit
import SwiftUI
extension View {
    func setupNavigationBarAppearance(titleColor: UIColor, barColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = barColor
        appearance.titleTextAttributes = [.foregroundColor: titleColor]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
struct InfoText: View {
    var body: some View {
        Text("Enter your email and password")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.primary)
    }
}
 

struct LoginJourney: View {
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var isEmailValid : Bool   = true
    @State private var showShareSheet = false
        
//    init() {
//        setupNavigationBarAppearance(titleColor: UIColor.white, barColor: UIColor(.black))
//    }
    var body: some View {
       
        NavigationView {
                    VStack() {
                        InfoText().padding(.top, 50)
                        // For Share actionView
//                        Button(action: {
//                                        self.showShareSheet = true
//                                    }) {
//                                        Text("Share Me").bold()
//                                    }
                        VStack(alignment: .leading, spacing: 11) {
                            Text("Email")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.black)
                                .frame(height: 15, alignment: .leading)
                            
                            TextField("", text: $login)
                                .font(.system(size: 17, weight: .thin))
                                .foregroundColor(.primary)
                                .frame(height: 44)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(20.0)
                        }
                        .padding([.leading, .trailing], 27.5)
                        .padding([.top], 20.0)
                        
                        VStack(alignment: .leading, spacing: 11) {
                            Text("Password")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.black)
                                .frame(height: 15, alignment: .leading)
                            
                            SecureField("", text: $password)
                                .font(.system(size: 17, weight: .thin))
                                .foregroundColor(.primary)
                                .frame(height: 44)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(20.0)
                        }
                        .padding([.leading, .trailing], 27.5)
                        .padding([.top], 20.0)
                        Button {
                            debugPrint("Login Button Tapped!")
                        } label: {
                            Text("Login")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                                .frame(width: 215, height: 44, alignment: .center)
                              
                        }
                        .background(.secondary)
                        .cornerRadius(20)
                        .padding(.top, 36)
                        
                        Spacer()
                    }
                   // For share shett display
                    .sheet(isPresented: $showShareSheet) {
                                ShareSheet(activityItems: ["Hello World"])
                            }
                    .background(
                      LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
                }
            }
}
struct LoginJourney_Previews: PreviewProvider {
    static var previews: some View {
        LoginJourney()
    }
}
struct ShareSheet: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}
struct ShareSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheet(activityItems: ["A string" as NSString])
    }
}

