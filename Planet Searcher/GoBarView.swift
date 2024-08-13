//
//  GoBarView.swift
//  Webster
//
//  Created by Arthur Roolfs on 11/29/22.
//

import SwiftUI

struct GoBarView: View {
    
    @Binding var goString: String
    @FocusState var focus: Bool
    var title: String

    var action: (() -> Void)? = nil
    
    var body: some View {
        
        HStack {
            Text(title)
                .font(.body)
                .fontWeight(.heavy)
            TextField(title, text: $goString)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .focused($focus)
                .onSubmit {
                    if let doIt = action { doIt() }
                }
            Button {
                if let doIt = action { doIt() }
            } label: {
                Label("", systemImage: "arrow.right.square.fill")
            }
            .disabled(goString.isEmpty)
        }
        .padding()

    }
}

struct GoBarView_Previews: PreviewProvider {
    static var previews: some View {
        GoBarView(goString: .constant(""), title: "Url")
    }
}
