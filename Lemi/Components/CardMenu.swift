import SwiftUI

struct CardMenu: View {
    let entry: RecipeModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            // Replace AsyncImage with CachedAsyncImage
            CachedAsyncImage(url: entry.imageLink ?? "") {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 225)
                    .overlay { ProgressView() }
            }
            .scaledToFill() // Apply modifiers directly to the CachedAsyncImage output
            .frame(maxWidth: .infinity, maxHeight: 225)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text(entry.title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color.AppTheme.textPrimary)
                .multilineTextAlignment(.leading)
            
            LabelPreference(entry: entry)
                .frame(width: 280)
            
        }
        .padding(16)
        .background(Color.AppTheme.lightYellow)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
    }
}
