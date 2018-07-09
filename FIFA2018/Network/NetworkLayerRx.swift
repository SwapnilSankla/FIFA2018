import Foundation
import RxSwift

enum NetworkError: Error {
    case error
}

typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Void


class NetworkLayerRx<T: Decodable> {

    var response = AsyncSubject<T>()

    func get(url: URL) {

        let completionHandler: NetworkCompletionHandler = { (data, urlResponse, error) in
            if let error = error {
                print(error.localizedDescription)
                self.response.onError(NetworkError.error)
                return
            }

            if let unwrappedUrlResponse = urlResponse as? HTTPURLResponse {
                if self.isSuccessCode(unwrappedUrlResponse.statusCode) {
                    if let data = data {
                        if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                            self.response.onNext(responseObject)
                            return
                        } else {
                            print("Unable to parse the response in given type \(T.self)")
                        }
                    }
                }
            }
            self.response.onError(NetworkError.error)
        }

        URLSession.shared.dataTask(with: url, completionHandler: completionHandler).resume()
    }

    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
}
