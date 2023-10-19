//
//  IPAddressInputView.swift
//  Network Calculator
//
//  Created by Tomasz Kubicki on 01/09/2023.
//

import SwiftUI

struct IPAddressInputView: View {
    
    @Binding var ipAddress: [Int]
    @State var ipMaskCIDRNotationLocal: Int = 0
    
    var body: some View {
        
        HStack {
            
            ForEach (0..<4) { octet in

                    HStack {
                        
                        Picker("", selection: $ipAddress[octet]) {
                            
                            ForEach (0..<256) {num in
                                Text("\(num)")
                            }
                        }
                        .pickerStyle(.wheel)
                        
                        if octet < 3 {
                            Text(".")
                        }
                    }
                    .frame(height: 45)
            }
            Text("/")
            
            HStack {
             
                Picker("", selection: $ipMaskCIDRNotationLocal) {
                    
                    ForEach (0..<33) {num in
                        Text("\(num)")
                    }
                }
                .pickerStyle(.wheel)
            }
            .frame(height: 45)
        }
    }
}
//
//struct IPAddressInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        IPAddressInputView()
//    }
//}
