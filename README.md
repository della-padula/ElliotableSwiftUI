# ElliotableSwiftUI
ElliotableSwiftUI is simple library to generate **Timetable** of University.   
If you only add a course, **the course time is automatically calculated** and added to the timetable.  

## Author Information  
Timetable Library for iOS Development   
Author : Denny.K (Taein Kim) / Seoul, South Korea   
Email : della.kimko@gmail.com   
Blog : https://terry-some.tistory.com/  

[![Version](https://img.shields.io/badge/version-v0.0.1-green.svg?style=flat)](https://cocoapods.org/pods/ElliotableSwiftUI)
[![Version](https://img.shields.io/badge/ios-14.0-blue.svg?style=flat)](https://cocoapods.org/pods/ElliotableSwiftUI)
[![Version](https://img.shields.io/cocoapods/v/ElliotableSwiftUI.svg?style=flat)](https://cocoapods.org/pods/ElliotableSwiftUI)
[![License](https://img.shields.io/cocoapods/l/ElliotableSwiftUI.svg?style=flat)](https://cocoapods.org/pods/ElliotableSwiftUI)
[![Platform](https://img.shields.io/cocoapods/p/ElliotableSwiftUI.svg?style=flat)](https://cocoapods.org/pods/ElliotableSwiftUI)

## Installation  
### Cocoapods (Under Construction)
Elliotable is available through CocoaPods, to install it simply add the following line to your Podfile:   
```ruby
pod 'ElliotableSwiftUI'
```

## Usage     

### Course Item Structure   
```swift
courseId : The identifier of the course   
courseName : The name of the course
roomName : The name of the lecture room
professor : Professor Name
courseDay : Weekday of the course
startTime : Start time of course (String type - format : "HH:mm")
endTime : End time of course (String type - format : "HH:mm")
backgroundColor : backgroud color of each course item
(Optional) textColor: Course Item Text Color
```

### Generate Swift UI View  
You can generate timetable view by adding properties about styles of timetable.  
A source code below indicates some examples generate time table view.  

```swift
struct ContentView: View {
    var body: some View {
        generateTimetableView()
    }
    
    private func generateTimetableView() -> ElliotableView {
        let courseList = [
            ElliottEvent(courseId: "111", courseName: "TEST1", roomName: "ROOM1", professor: "PROF1", courseDay: .monday, startTime: "09:00", endTime: "10:15", backgroundColor: .systemBlue),
            ElliottEvent(courseId: "222", courseName: "TEST2", roomName: "ROOM2", professor: "PROF1", courseDay: .tuesday, startTime: "13:30", endTime: "14:45", backgroundColor: .orange),
            ElliottEvent(courseId: "333", courseName: "TEST3", roomName: "ROOM3", professor: "PROF1", courseDay: .thursday, startTime: "19:00", endTime: "20:45", backgroundColor: UIColor(displayP3Red: 0, green: 1.0, blue: 1.0, alpha: 0.5)),
            ElliottEvent(courseId: "444", courseName: "TEST4", roomName: "ROOM4", professor: "PROF4", courseDay: .tuesday, startTime: "14:30", endTime: "18:00", backgroundColor: UIColor(displayP3Red: 1.0, green: 1.0, blue: 0, alpha: 0.5))]
        let daySymbols = ["월", "화", "수", "목", "금", "토", "일"]
        let elliotableView = ElliotableView()
        
        elliotableView.courseList(list: courseList)
        elliotableView.dayCount(count: 5)
        elliotableView.daySymbols(symbols: daySymbols)
        elliotableView.borderColor(color: Color(.sRGB, red: 0.7, green: 0.7, blue: 0.7, opacity: 1))
        elliotableView.headerFont(font: .system(size: 14, weight: .bold))
        elliotableView.symbolBackgroundColor(color: Color(.sRGB, red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
        elliotableView.timeHeaderTextColor(color: Color(.sRGB, red: 0.6, green: 0.6, blue: 0.6, opacity: 1))
        
        return elliotableView
    }
}
```

(Under Construction)  
