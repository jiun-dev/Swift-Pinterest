import Alamofire

func getCats() {
    let url = "https://dog.ceo/api/breeds/image/random/10"
    AF.request(url).responseJSON() { response in
      switch response.result {
      case .success:
        if let data = try! response.result.get() as? [String: Any] {
          print(data)
        }
      case .failure(let error):
        print("Error: \(error)")
        return
      }
    }
}

