import SwiftUI

struct RateThisGameFullView: View {
    @EnvironmentObject private var router: HomeRouter
    @State private var rating: Int = 0   // 0 means “no rating yet”
    let id : Int

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Rate This Game:")
                .foregroundStyle(.gray)
            Stars(rating: $rating)
        }
        .padding()
        
        if rating > 0 {
            ReviewButton(id: id, rating: rating)
        }
    }
    
}

struct Stars : View {
    @Binding var rating: Int
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<5) { index in
                Button {
                    let newRating = index + 1
                    rating = (rating == newRating) ? 0 : newRating
                    //TODO network call to update users ratings
                } label: {
                    Image(systemName: index < rating ? "star.fill" : "star")
                        .font(.title)
                        .foregroundStyle(index < rating ? .yellow : .gray)
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Rate \(index + 1) star\(index == 0 ? "" : "s")")
            }
        }
    }
}

#Preview {
    RateThisGameFullView(id: 1)
}

