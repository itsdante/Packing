
import SwiftyJSON

class APIManager {
let baseurl = "http://128.199.215.67:3000/api/v1" // web gw
static let sharedInstance = APIManager() //api managernya
static let getPostsEndpoint = "/recipes" //endpoint belakang tiap orang beda

    func getActivities(gender: String, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseurl + "/activities?filter[where][gender]=\(gender)"
        let request : NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            }else {
                do {
                let result = try JSON(data: data!)
                    print(result)
                    onSuccess(result)
                } catch {
                    //error
                }
                
                
            }
        })
        task.resume()
    }
    func checkBookingCode(bookingCode: String, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseurl + "/bookings/trip/\(bookingCode)"
        
//        let parameterDictionary = ["bookingId" : bookingCode]
        let request : NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
//        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
//        return
//        }
//            request.httpBody = httpBody
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            }else {
                do {
                let result = try JSON(data: data!)
                    print(result)
                    onSuccess(result)
                } catch {
                    //error
                }
                
                
            }
        })
        task.resume()
    }
    
//contoh function
func getWeather(recipeId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
    let url : String = baseurl + APIManager.getPostsEndpoint + String(recipeId)
    let request : NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
    request.httpMethod = "GET"
    let session = URLSession.shared
    
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
        if(error != nil){
            onFailure(error!)
        }else {
            do {
            let result = try JSON(data: data!)
                onSuccess(result)
            } catch {
                //error
            }
            
            
        }
    })
    task.resume()
}
    
    
func getBooking(onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
       let url : String = baseurl + APIManager.getPostsEndpoint
       let request : NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
       request.httpMethod = "GET"
       let session = URLSession.shared
       
       let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
           if(error != nil){
               onFailure(error!)
           }else {
               do {
               let result = try JSON(data: data!)
                   print(result)
                   onSuccess(result)
               } catch {
                   //error
               }
               
               
           }
       })
       task.resume()
   }
}

