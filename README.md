# Frontend Coding Challenge BrowsrFramework

# Part 2

# General Info

Browrs is gaining popularity so we replace a static network layer with a package that can be added to the Swift Package Manager (SPM) for future updates.

# Installation

In Xcode
File -> Add Packages -> Insert this url: https://github.com/brunojasgv/BrowsrFramework.git
<img width="500" alt="Screenshot 2023-01-29 at 11 51 11" src="https://user-images.githubusercontent.com/1737683/215324307-a686c1fe-354d-410d-9020-36215d4b33c9.png">

# How to Use

This framework uses the new Swift 5.5: Async/Await.

```swift
private let browsr = Browsr()

@MainActor //Run on the main queue
Task {
       do {
          //fetching organizations
           self.organizations = try await self.browsrAPI.fetchOrgs(page: self.page)
          } catch let error {
                debugPrint("getOrganizations failed with error \(error)")
          }
     }.cancel()

// Fetch image by calling asynchronous functions sequentially
func fetchSingleImage() async throws -> UIImage {
    //fetch the organization
	let org = try await self.browsrAPI.searchOrgs(name: "Microsoft")
    //fetch the image
	let (data, _) = try await URLSession.shared.data(from: org.avatarURL)
	return UIImage(data: data)!
}
