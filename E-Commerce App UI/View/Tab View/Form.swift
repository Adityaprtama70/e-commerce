//
//  Form.swift
//  E-Commerce App UI
//
//  Created by Adit on 16/07/23.
//

import SwiftUI

struct UserProfileForm: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var hobby: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Hobby", text: $hobby)
            }
            
            Section {
                Button(action: saveProfile) {
                    Text("Save")
                }
            }
        }
        .navigationBarTitle("Profile")
        
    }
    
    func saveProfile() {
        print("Saving profile...")
        print("First Name: \(firstName)")
        print("Last Name: \(lastName)")
        print("Hobby: \(hobby)")
    }
}


struct UserProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileForm()
    }
}

