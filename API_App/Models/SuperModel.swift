//
//  SuperModel.swift
//  API_App
//
//  Created by Jonah Reinis on 1/20/23.
//

import Foundation

let randNum = Int.random(in: 1..<101)

let isEven = "(https://api.isevenapi.xyz/api/iseven/\(randNum)/)"
let lastWeekEarthquakes = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_week.geojson"
let randomCatFacts = "https://cat-fact.herokuapp.com/facts"
let weatherLink = "https://api.open-meteo.com/v1/forecast?latitude=22.28&longitude=114.17&hourly=temperature_2m"
let currentISSLocation = "http://api.open-notify.org/iss-now.json"
let currentAstronautsInSpace = "http://api.open-notify.org/astros.json"

func loadEven(completion:@escaping (IsEven) -> Void)
{
    let evenURL = URL(string: isEven)!
    let evenRequest = URLRequest(url:evenURL)
    let evenTask = URLSession.shared.dataTask(with: evenRequest)
    {
        data, response, error in
        do
        {
            if let data = data{
                let dataString = String(data: data, encoding: .utf8)!
                print("______")
                print(dataString)
                let evens = try! JSONDecoder().decode(IsEven.self, from: data)
                completion(evens)
                print(evens)
            }
        }
    }
    evenTask.resume()
}

func loadEarthquakes(completion:@escaping (Earthquakes) -> Void)
{
    let earthquakeUrl = URL(string:lastWeekEarthquakes)!
    let earthquakeRequest = URLRequest(url:earthquakeUrl)
    let earthquakeTask = URLSession.shared.dataTask(with: earthquakeRequest)
    {
        data, response, error in
        do
        {
            if let data = data{
                let dataString = String(data: data, encoding: .utf8)!
                print("______")
                print(dataString)
                let earthquakes = try! JSONDecoder().decode(Earthquakes.self, from: data)
                completion(earthquakes)
                print(earthquakes)
            }
        }
    }
    earthquakeTask.resume()
}
func loadWeather(completion:@escaping (Weather) ->Void)
{
    let weatherURL = URL(string:weatherLink)!
    let weatherRequest = URLRequest(url:weatherURL)
    let weatherTask = URLSession.shared.dataTask(with: weatherRequest)
    {
        data, response, error in
        if let data = data
        {
            let weatherString = String(data: data, encoding: .utf8)!
            print(weatherString)
            let weather = try! JSONDecoder().decode(Weather.self, from: data)
            completion(weather)
        }
    }
    weatherTask.resume()
}
func loadISS(completion:@escaping (ISS) ->Void)
{
    let ISSLocationUrl = URL(string:currentISSLocation)!
    let ISSLocationRequest = URLRequest(url:ISSLocationUrl)
    let ISSTask = URLSession.shared.dataTask(with: ISSLocationRequest)
    {
        data, response, error in
        if let data = data
        {
            let ISSString = String(data: data, encoding: .utf8)!
            print(ISSString)
            let iss = try! JSONDecoder().decode(ISS.self, from: data)
            completion(iss)
        }
    }
    ISSTask.resume()
}
func loadCat(completion:@escaping (Cat) ->Void)
{
    let catFactsUrl = URL(string:randomCatFacts)!
    let catFactsRequest = URLRequest(url:catFactsUrl)
    let catTask = URLSession.shared.dataTask(with: catFactsRequest)
    {
        data, response, error in
            if let data = data
            {
                let CatString = String(data: data, encoding: .utf8)!
                print(CatString)
                let cat = try! JSONDecoder().decode(Cat.self, from: data)
                completion(cat)
        }
    }
    catTask.resume()
}
func loadAstronauts(completion:@escaping (Astronauts) ->Void)
{
    let astronautsInSpaceUrl = URL(string:currentAstronautsInSpace)!
    let astronautsInSpaceRequest = URLRequest(url:astronautsInSpaceUrl)
    let astronautsTask = URLSession.shared.dataTask(with: astronautsInSpaceRequest)
    {
        data, response, error in
        if let data = data
        {
            let AstronautString = String(data: data, encoding: .utf8)!
            print(AstronautString)
            let astronauts = try! JSONDecoder().decode(Astronauts.self, from: data)
            completion(astronauts)
        }
    }
    astronautsTask.resume()
}

let chosenImage = "https://collectionapi.metmuseum.org/public/collection/v1/objects/45733"

func loadMet(completion:@escaping (MetImage) -> Void)
{
    let url = URL(string:chosenImage)!
    let request = URLRequest(url:url)
    let metTask = URLSession.shared.dataTask(with: request)
    {
        data, response, error in
        do
        {
            if let data = data{
                let dataString = String(data: data, encoding: .utf8)!
                print("______")
                print(dataString)
                let metimage = try! JSONDecoder().decode(MetImage.self, from: data)
                print(metimage)
                
                completion(metimage)
            }
        }
        catch
        {
            print(error)
        }
    }
    metTask.resume()
}
