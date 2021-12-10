//
//  DiaryDB.swift
//  Fleur
//
//  Created by minii on 2021/11/17.
//

import Foundation
import RealmSwift
import SwiftUI

class DiaryDB: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) var id: ObjectId
  @Persisted var date: Date = Date()
  @Persisted var contents = RealmSwift.List<_DiaryContent>()
}

class _DiaryContent: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) var id: ObjectId
  @Persisted var type: String = ContentType.text.rawValue
//  @Persisted var content: Object = TextContent()
  @Persisted var textContent: TextContent? = TextContent()
  @Persisted var imageContent: ImageContent? = nil
  
  convenience init(type: ContentType, textContent: TextContent?, imageContent: ImageContent?) {
    self.init()
    self.type = type.rawValue
    self.textContent = textContent
    self.imageContent = imageContent
  }
}

class ImageContent: Object {
//  @Persisted(primaryKey: true) var id: ObjectId
//  @Persisted var type: String = DataType.image.rawValue
  @Persisted var img: Data = Data(count: 0)
}

class TextContent: Object {
//  @Persisted(primaryKey: true) var id: ObjectId
//  @Persisted var type: String = DataType.text.rawValue
  @Persisted var text: String = "Empty Text"
}

enum DiaryMock {
  
  static var sampleImage: Data {
//    if let data = UIImage(named: "1")?.pngData() {
//      return data
//    }
//    return nil
    UIImage(named: "1")!.pngData()!
  }
  
  static var image1: ImageContent {
    let imageContent = ImageContent()
    imageContent.img = DiaryMock.sampleImage
    return imageContent
  }
  static let text1 = TextContent()
  
  static let contentImage = _DiaryContent(type: ContentType.image, textContent: nil, imageContent: image1)
  static let contentText = _DiaryContent(type: ContentType.text, textContent: text1, imageContent: nil)
  
  static var diary1: DiaryDB {
    let diary = DiaryDB()
    diary.contents.append(contentImage)
    diary.contents.append(contentText)
    diary.contents.append(contentImage)
    diary.contents.append(contentText)
    diary.contents.append(contentImage)
    diary.contents.append(contentText)
    diary.contents.append(contentImage)
    diary.contents.append(contentImage)
    return diary
  }
  
  static func LayoutData3() -> [_DiaryContent] {
    var data: [_DiaryContent] = []
    data.append(DiaryMock.diary1.contents[0])
    data.append(DiaryMock.diary1.contents[1])
    data.append(DiaryMock.diary1.contents[2])
    return data
  }
  
  static func LayoutData2() -> [_DiaryContent] {
    var data: [_DiaryContent] = []
    data.append(DiaryMock.diary1.contents[0])
    data.append(DiaryMock.diary1.contents[0])
    return data
  }
  
  static func LayoutData1() -> [_DiaryContent] {
    var data: [_DiaryContent] = []
    data.append(DiaryMock.diary1.contents[0])
    return data
  }
  
  static func compoLayoutData() -> [[_DiaryContent]] {
    var data: [[_DiaryContent]] = []
    data.append(DiaryMock.LayoutData3())
    data.append(DiaryMock.LayoutData3())
//    data.append(DiaryMock.LayoutData3())
//    data.append(DiaryMock.LayoutData3())
    data.append(DiaryMock.LayoutData2())
    return data
  }
  
}

enum ContentType: String {
  case image
  case text
}

//struct _Diary {
//  let date: Date
//  var contents: [Any]
//}
//
//struct _Text_Content {
//  var text: String
//  var fontsize: Int
//}
//
//struct _Image_Content {
//  var img: Data
//  var imgsize: Int
//}
//
