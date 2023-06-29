# app/models/animal_adoption.rb
require 'json'
require 'open-uri'

class AnimalAdoption < ApplicationRecord
  def self.fetch_data
    url = 'https://data.montgomerycountymd.gov/resource/e54u-qx42.json?$query=SELECT%0A%20%20%60animalid%60%2C%0A%20%20%60intype%60%2C%0A%20%20%60indate%60%2C%0A%20%20%60petname%60%2C%0A%20%20%60animaltype%60%2C%0A%20%20%60petage%60%2C%0A%20%20%60petsize%60%2C%0A%20%20%60color%60%2C%0A%20%20%60breed%60%2C%0A%20%20%60sex%60%2C%0A%20%20%60url%60%2C%0A%20%20%60crossing%60%2C%0A%20%20%60%3A%40computed_region_vu5j_pcmz%60%2C%0A%20%20%60%3A%40computed_region_tx5f_5em3%60%2C%0A%20%20%60%3A%40computed_region_kbsp_ykn9%60%2C%0A%20%20%60%3A%40computed_region_d7bw_bq6x%60%2C%0A%20%20%60%3A%40computed_region_rbt8_3x7n%60%0AORDER%20BY%20%60indate%60%20DESC%20NULL%20FIRST'
    json_data = URI.open(url).read
    parsed_data = JSON.parse(json_data)

    # Process the data and save to the database
    parsed_data.each do |record|
      animal_adoption = AnimalAdoption.new(
        animalid: record['animalid'],
        intype: record['intype'],
        indate: record['indate'],
        petname: record['petname'],
        animaltype: record['animaltype'],
        petage: record['petage'],
        petsize: record['petsize'],
        color: record['color'],
        breed: record['breed'],
        sex: record['sex'],
        url: record['url'],
        crossing: record['crossing']
      )
      animal_adoption.save
    end

    # Return the fetched data
    AnimalAdoption.all
  end
end
