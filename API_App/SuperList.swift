//
//  SuperList.swift
//  API_App
//
//  Created by Jonah Reinis on 1/23/23.
//

import SwiftUI

struct SuperList: View {
    @State var weather:Weather?
    @State var metimageData:MetImage?
    @State var earthquakeData:Earthquakes?
    @State var catFactsData:Cat?
    @State var ISSLocationData:ISS?
    @State var astronautsData:Astronauts?
    @State var evenData:IsEven?
    func loadAll()
    {
            loadEven{ (evens) in self.evenData = evens}
            loadEarthquakes{ (earthquakes) in self.earthquakeData = earthquakes}
            loadWeather{ (weather) in self.weather = weather}
            loadISS{ (iss) in self.ISSLocationData = iss}
            loadAstronauts{ (astronauts) in self.astronautsData = astronauts}
        loadMet { (metimages) in self.metimageData = metimages}
    }
    var body: some View {
        if let earthquakeData = earthquakeData
        {
            HStack
            {
                VStack
                {
                    Text(earthquakeData.type)
                    if let metimageData = metimageData
                    {
                        Text(metimageData.period)
                        AsyncImage(url: URL(string: metimageData.primaryImage))
                        {
                            image in image.resizable().aspectRatio(contentMode: .fit)
                        }
                    placeholder:
                        {
                            ProgressView()
                        }
                        Text(metimageData.dimensions).font(.system(size: 10))
                    }
                    if let astronautsData = astronautsData
                    {
                        Text(astronautsData.message)
                        Text(astronautsData.people.description).font(.system(size: 10))
                    }
                    if let ISSLocationData = ISSLocationData
                    {
                        HStack
                        {
                            Text(ISSLocationData.issPosition.latitude)
                            Text(ISSLocationData.issPosition.longitude)
                        }
                    }
                }
                if let metimageData = metimageData
                {
                    if metimageData.isPublicDomain == true
                    {
                        Text("this image is public domain")
                    }
                    else
                    {
                        Text("this image is not public domain")
                    }
                }
                Text(earthquakeData.features.description).font(.system(size: 10))
                VStack
                {
                    if let evenData = evenData
                    {
                        Text("even steven")
                        if evenData.iseven == true
                        {
                            Text("\(randNum) is even")
                        }
                        else
                        {
                            Text("\(randNum) is odd")
                        }
                    }
                }
            }
        }
        else
        {
            Text("loading...")
                .onAppear(perform: {loadAll()})
        }
        
        if let weather = weather
        {
            Text("Hong kong's temperature")
            Text(weather.hourly.temperature2M.description).font(.system(size: 10))
        }
    }
}

struct SuperList_Previews: PreviewProvider {
    static var previews: some View {
        SuperList()
    }
}
