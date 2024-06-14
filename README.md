# WeatherAppTeam4
Weather Predicting App
# Weather App

A simple weather app that allows you to add favorite cities and view weather information for them.

## Key Features

- Weather checking for added cities.

## System Requirements

- macOS version: Not specified
- Xcode version: Not specified
- Swift version: iOS 17.0

## Repository URL

[https://github.com/nuca01/WeatherAppTeam4.git](https://github.com/nuca01/WeatherAppTeam4.git)

## Additional Instructions

For users wanting to test out animations, follow these steps:
- Navigate to `Scenes -> Weather Page -> WeatherPageView`.
- Modify line 28 to set `AllAnimationView(weather: appropriateStringForAnimation)`.

Values for `appropriateStringForAnimation`:
- `//01d` sun + birds
- `//01n` moon + stars
- `//02d` sun + clouds(full)
- `//02n` moon + clouds(full)
- `//03d` clouds(full)
- `//03n` clouds(full)
- `//04d` clouds(full)
- `//04n` clouds(full)
- `//09d` clouds(half) + rain
- `//09n` clouds(half) + rain
- `//10d` sun + clouds(half) + rain
- `//10n` moon + clouds(half) + rain
- `//11d` clouds(half) + rain + thunder
- `//11n` clouds(half) + rain + thunder
- `//13d` snow + clouds
- `//13n` snow + clouds
- `//50d` clouds(full)
- `//50n` clouds(full)

## Main Files and Directories

- `Animations Directory`: Handles all backgrounds for weather conditions.
- Other directories follow basic MVVM architecture.
