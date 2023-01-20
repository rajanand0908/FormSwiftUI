//
//  FormView.swift
//  FormSwiftUI
//
//  Created by Raj Anand on 20/01/23.
//

import SwiftUI

struct FormView: View {
  
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var dateOfBirth = Date()
  @State private var subscribeNotifications = false
  @State private var numberOfLikes = 1
  
  var body: some View {
    NavigationView {
      Form {
        Section("Personal Information") {
          TextField("First Name",
                    text: $firstName)
          TextField("Last Name",
                    text: $lastName)
          DatePicker("Date of birth",
                     selection: $dateOfBirth,
                     displayedComponents: .date)
        }
        
        Section("Actions") {
          Toggle("Subscribe Notifications",
                 isOn: $subscribeNotifications)
            .toggleStyle(SwitchToggleStyle(tint: .purple))
          Stepper("Number of likes", value: $numberOfLikes, in: 1...1000)
          Text("This video has \(numberOfLikes) likes")
          // TODO: Add actual url
          Link("Terms of services", destination: URL(string: "https://google.com")!)
        }
      }
      .navigationTitle("Account")
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button {
            hideKeyboard()
          } label: {
            Image(systemName: "keyboard.chevron.compact.down")
          }
        }
      }
    }
    .accentColor(.purple)
  }
}

struct FormView_Previews: PreviewProvider {
  static var previews: some View {
    FormView()
  }
}

#if canImport(UIKit)
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif
