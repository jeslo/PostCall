
import Foundation
enum PostType {
    case postSample
}
protocol NetworkHandlerDeligate {
    func hitApi(dataGet: Any)
}
class NetworkHandler
{
var networkDeligate: NetworkHandlerDeligate!
    func getApi(url: String, dataStruct: PostType)
{
    
    let parameters = [
        "email": "eve.holt@reqres.in",
        "password": "pistol"]
    print("Original Parameters", parameters)
    let apiurl = URL(string: url)
    
    var request = URLRequest(url: apiurl!)
    request.httpMethod = "POST"
    guard let httpBody = try? JSONEncoder().encode(parameters) else {return}
    
    request.httpBody = httpBody
    let session = URLSession.shared

    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    
    let postDataGet = session.dataTask(with: apiurl!) { data, response, error in
        guard let httpresponse = response as? HTTPURLResponse, let received = data
            else{
                print("error: not a valid http response")
                return
                }
            switch (httpresponse.statusCode)
            {
            case 200: print("success")
            print(">>>>>>>>>", received)
                switch dataStruct
                {
                case PostType.postSample:
                    do
                    {
                    let parsedData = try JSONDecoder().decode(HomeDataStruct.self, from: received)
                        print("Decoded Data", parsedData.data)
                        self.networkDeligate.hitApi(dataGet: parsedData)
                    }
                    catch {
                        print("Decoding Failed")
                    }
                    break
                    
                    
                }
                break
            default:
                print("failed")
                break
        }
    }
    postDataGet.resume()
}
}
