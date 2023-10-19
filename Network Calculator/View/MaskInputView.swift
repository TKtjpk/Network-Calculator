//
//  MaskInputView.swift
//  Network Calculator
//
//  Created by Tomasz Kubicki on 01/09/2023.
//

import SwiftUI

struct MaskInputView: View {
    
    let ipMaskConstants = [0, 128, 192, 224, 240, 248, 252, 254, 255]
    
    @State var ipMask: [Int] = [0,0,0,0]
    
    @Binding var ipMaskCalc: [Int]
    
    var body: some View {
        
        HStack {
            
            ForEach (0..<4) { octet in
                
                HStack {
                    
                    Picker("", selection: $ipMask[octet]) {
                        ForEach (ipMaskConstants, id: \.self) {num in
                            Text("\(num)")
                        }
                    }
                    .onChange(of: ipMask[octet]) { newValue in
                        ipMaskCalc[octet] = ipMaskConstants.firstIndex(of: newValue)!
                        
                        if newValue < 255 {
                            if octet < 4 {
                                for nextOctet in octet+1..<4 {
                                    ipMask[nextOctet] = 0
                                }
                            }
                        }
                        
                        if octet > 0 {
                            for previousOctet in 0..<octet {
                                if ipMask[previousOctet] < 255 {
                                    for nextOctet in octet..<4 {
                                        ipMask[nextOctet] = 0
                                    }
                                }
                            }
                        }
                    }
                    .pickerStyle(.wheel)
                    .cornerRadius(15)
                    .shadow(radius: 5, x: -2, y: 3)
                    
                    if octet < 3 {
                        Text(".")
                    }
                }
            }
            .frame(height: 45)
        }
    }
}

//struct MaskInputView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        MaskInputView()
//    }
//}
