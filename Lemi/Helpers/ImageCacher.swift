import SwiftUI
import Combine

// 1. The memory cache
class ImageCache {
    static let shared = ImageCache()
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    func set(forKey key: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}

// 2. The observable fetcher
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var urlString: String
    private var cancellable: AnyCancellable?
    
    init(urlString: String) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        // Return immediately if cached
        if let cachedImage = ImageCache.shared.get(forKey: urlString) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        // Fetch if not cached
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] downloadedImage in
                if let downloadedImage = downloadedImage {
                    ImageCache.shared.set(forKey: url.absoluteString, image: downloadedImage)
                    self?.image = downloadedImage
                }
            }
    }
}
