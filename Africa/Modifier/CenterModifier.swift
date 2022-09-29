//
//  CenterModifier.swift
//  Africa
//
//  Created by Jersy Fernandes on 31/08/2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
        
    }
    
}
