//
//  CreditsView.swift
//  Africa
//
//  Created by Jersy Fernandes on 31/08/2022.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack{
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
        Copyright @ Jersy Fernandes
        All right reserved
        Better Apps... Lets Code
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
