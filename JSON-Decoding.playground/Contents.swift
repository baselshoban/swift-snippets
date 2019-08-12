import UIKit

class Record: Codable {
    let id: Int
    let name: String
    let events: [Event]
    
    init(_ id: Int, name: String, events: [Event]) {
        self.id = id
        self.name = name
        self.events = events
    }
}

class Event: Codable {
    let id: Int
    let at: Date
    let title: String
    
    init(_ id: Int, at: Date, title: String) {
        self.id = id
        self.at = at
        self.title = title
    }
}

let response = "[{\"id\":1,\"name\":\"testy\",\"events\":[{\"id\":1,\"at\":\"2019-06-21 12:00:00\",\"title\":\"pray\"}]},{\"id\":2,\"name\":\"testy2\",\"events\":[{\"id\":1,\"at\":\"2019-06-21 12:00:00\",\"title\":\"pray2\"}]},{\"id\":1,\"name\":\"testy\",\"events\":[{\"id\":1,\"at\":\"2019-06-21 12:00:00\",\"title\":\"pray\"}]},{\"id\":1,\"name\":\"testy\",\"events\":[{\"id\":1,\"at\":\"2019-06-21 12:00:00\",\"title\":\"pray\"}]},{\"id\":1,\"name\":\"testy\",\"events\":[{\"id\":1,\"at\":\"2019-06-21 12:00:00\",\"title\":\"pray\"}]},{\"id\":1,\"name\":\"testy\",\"events\":[{\"id\":1,\"at\":\"2019-06-21 12:00:00\",\"title\":\"pray\"}]},{\"id\":1,\"name\":\"testy\",\"events\":[{\"id\":1,\"at\":\"2019-06-21 12:00:00\",\"title\":\"pray\"}]},{\"id\":1,\"name\":\"testy\",\"events\":[{\"id\":1,\"at\":\"2019-06-21 12:00:00\",\"title\":\"pray\"}]},{\"id\":1,\"name\":\"testy\",\"events\":[{\"id\":1,\"at\":\"2019-06-21 12:00:00\",\"title\":\"pray\"}]}]"
let jsonData = response.data(using: .utf8)!
let decoder = JSONDecoder()
var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
decoder.dateDecodingStrategy = .formatted(dateFormatter)
let newRecord = try! decoder.decode([Record].self, from: jsonData)

print(newRecord.count)
print(newRecord[1].name)
