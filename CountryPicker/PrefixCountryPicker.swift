//
//  PrefixCountryPicker.swift
//
//  Created by Rok Gregorič on 27. 10. 15.
//

import libPhoneNumber_iOS

public class PrefixCountryPicker: CountryPicker {
  static var prefixCountryCodesByName = [NSObject: AnyObject]()

  override public class func countryNamesByCode() -> [NSObject : AnyObject]! {
    if prefixCountryCodesByName.isEmpty {
      let phoneUtil = NBPhoneNumberUtil()
      var list = super.countryNamesByCode() as! [String: String]
      for (code, name) in list {
        let prefix = phoneUtil.getCountryCodeForRegion(code)?.integerValue ?? 0 // 0 is the default anyway
        list[code] = prefix > 0 ? "\(name) (+\(prefix))" : nil
      }
      prefixCountryCodesByName = list
    }
    return prefixCountryCodesByName
  }
}
