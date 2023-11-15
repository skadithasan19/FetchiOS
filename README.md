## Introduction

App loads meals and details from the given API(#https://fetch-hiring.s3.amazonaws.com/iOS+coding+exercise.pdf). tried to follow MVVM architecture and created a network layer using a combine. made two independent service classes for API calls which is extendable. Added some unit tests using mock data

## File and structure
<img width="274" alt="Screenshot 2023-11-15 at 4 08 16 PM" src="https://github.com/skadithasan19/FetchiOS/assets/6060441/f789c587-c806-4df5-8eb8-73660d9f8dc6">

## Features

- Load meals for the Dessert category.
  - Display meal name
  - Display meal image under meal name
- Load meal details by selecting each meal on the listing page
  - Display meal name
  - Display meal instructions
  - Display ingredients and measures
 
## Screenshots
label 1 | label 2
--- | ---
![]([https://...image1.png](https://github.com/skadithasan19/FetchiOS/assets/6060441/96a83887-d2a1-45ba-bca2-aa350aa13a15)) | ![]([https://...image2.png](https://github.com/skadithasan19/FetchiOS/assets/6060441/757565d4-0d50-4d4f-9e93-fa4e96800d1a))
<img src="https://github.com/skadithasan19/FetchiOS/assets/6060441/96a83887-d2a1-45ba-bca2-aa350aa13a15" width="200"/> <img src="https://github.com/skadithasan19/FetchiOS/assets/6060441/757565d4-0d50-4d4f-9e93-fa4e96800d1a" width="300"/>



## Requirements

Outline any prerequisites or system requirements needed to run the project.

- iOS 15.0+
- Swift 5.0+
