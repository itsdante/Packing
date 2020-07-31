//
//  DateFormater.swift
//  Packing
//
//  Created by Andimas Bagaswara on 30/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

let timeFormater: DateFormatter = {
    let formater = DateFormatter()
    formater.dateFormat = "hh:mm"
    return formater
}()

let dayFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "dd"
  return formatter
}()

let monthFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "MMMM"
  return formatter
}()

let yearFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "YYYY"
  return formatter
}()

let dayMonthFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "d MMMM"
  return formatter
}()

let dayMonthYearFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "d MMMM, YYYY"
  return formatter
}()

let dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "MMM d, YYYY"
  return formatter
}()

func remainingDays(departureDate: Date, arrivalDate: Date) -> Int {
    let calendar = Calendar.current

    // Replace the hour (time) of both dates with 00:00
    let date1 = calendar.startOfDay(for: departureDate)
    let date2 = calendar.startOfDay(for: arrivalDate)

    let components = calendar.dateComponents([.day], from: date1, to: date2)
    return components.day ?? 0
}
