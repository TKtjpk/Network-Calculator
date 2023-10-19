//
//  DataInputView.swift
//  Network Calculator
//
//  Created by Tomasz Kubicki on 01/09/2023.
//

import SwiftUI

struct DataInputView: View {
    
    @State var ipAddress: [Int] = [0,0,0,0]
    
    @State var ipMaskCalc: [Int] = [0,0,0,0]
    
    @State var maskView: Bool = true
    
    @State var ipMaskCIDRNotation: Int = 0
    
    var body: some View {
        
        VStack {
            
            Section(header:
                        HStack {
                
                Text("IP ADDRESS").foregroundColor(.gray)
                
                Toggle(isOn: $maskView) {
                    
                    Text("")
                }
                .tint(.gray)
                
            }) {
                IPAddressInputView(ipAddress: $ipAddress)
                    .onChange(of: ipMaskCIDRNotation) { newValue in
                        
                    }
            }
            
            Section(header:
                        HStack {
                
                Text("MASK").foregroundColor(.gray)
                
                Spacer()
                
            }) {
                MaskInputView(ipMaskCalc: $ipMaskCalc)
                    .onChange(of: ipMaskCalc) { newValue in
                        ipMaskCIDRNotation = maskCIDRNotation(subnet_mask: ipMaskCalc)
                    }
            }
            
            let ipAddr = ipCIDRNotation(ip_address: ipAddress)
            
            Text("\(ipAddr)/\(ipMaskCIDRNotation)")
        }
    }
}

struct DataInputView_Previews: PreviewProvider {
    static var previews: some View {
        DataInputView()
    }
}

//Text("\(paddind(number: ipAddress[octet]))")
//    .font(.caption)

//Text("\(paddind(number: ipMask[octet]))")
//    .font(.caption)
