//
//  HorizontalListView.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

struct HorizontalListView: View {
    
    var statistiquesList: [Statistiques]

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(statistique) { statistique in
                    StatistiquesCell(statistique: statistique)
                }
            }
        }
    }
}
