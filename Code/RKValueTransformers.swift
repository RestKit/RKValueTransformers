//
//  RKValueTransformers.m
//  RestKit
//
//  Created by Samuel Giddins on 12/17/14.
//  Copyright (c) 2014 RestKit. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

extension RKValueTransformer {
    func transform<T: NSObjectProtocol>(value: AnyObject?, error: NSErrorPointer = NSErrorPointer()) -> T? {
        var ret: AnyObject?
        transformValue(value, toValue: &ret, ofClass: T.self, error: error)
        return ret as? T
    }
}

extension RKCompoundValueTransformer {
    func transform<T: NSObjectProtocol>(value: AnyObject?, error: NSErrorPointer = NSErrorPointer()) -> T? {
        var ret: AnyObject?
        transformValue(value, toValue: &ret, ofClass: T.self, error: error)
        return ret as? T
    }
}

func transform<T: NSObjectProtocol>(value: AnyObject?, error: NSErrorPointer = NSErrorPointer()) -> T? {
    var ret: AnyObject?
    RKValueTransformer.defaultValueTransformer()
        .transformValue(value, toValue: &ret, ofClass: T.self, error: error)
    return ret as? T
}
