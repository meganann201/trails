require "uri"
require "net/http"

namespace :nps_api do

  desc "Download all Parks from the NPS API and create Park records in the DB"
  task :scrape_parks => :environment do
    puts 'Getting parks from NPS API...'
    url = URI("https://developer.nps.gov/api/v1/parks?limit=467&api_key=#{ENV['nps_api_key']}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    puts 'Parsing API JSON response...'

    parks = JSON.parse(response.read_body)

    puts "Found #{parks['data'].length} parks..."

    parks['data'].each do |p|
      if Park.where(nps_park_id: p['id']).count == 0
        puts "Adding #{p['name']} to the local database..."
        new_park = Park.new
        new_park.nps_park_id = p['id']
        new_park.states = p['states']
        new_park.weather_info = p['weatherInfo']
        new_park.direction_info = p['directionsInfo']
        new_park.addresses = p['addresses']
        new_park.entrance_fees = p['entranceFees']
        new_park.topics = p['topics']
        new_park.name = p['name']
        new_park.latitude = p['latitude']
        new_park.activities = p['activities']
        new_park.operating_hours = p['operatingHours']
        new_park.url = p['url']
        new_park.longitude = p['longitude']
        new_park.contacts = p['contacts']
        new_park.entrance_passes = p['entrancePasses']
        new_park.park_code = p['parkCode']
        new_park.designation = p['designation']
        new_park.images = p['images']
        new_park.full_name = p['fullName']
        new_park.nps_park_id = p['id']
        new_park.directions_url = p['directionsUrl']
        new_park.description = p['description']
        new_park.save
      end
    end

  end


  desc "Download all hiking from the NPS API and create trails records in the DB"
  task :scrape_trails => :environment do



    url = URI("https://developer.nps.gov/api/v1/thingstodo?limit=2221&api_key=#{ENV['nps_api_key']}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    trails = JSON.parse(response.read_body)

    # binding.pry

    trails['data'].each do |t|
      # hike hiking trails
      if Activity.where(nps_things_to_do_id: t['id']).count == 0

        new_trail = Activity.new
        new_trail.short_description = t['shortDescription']
        new_trail.long_description = t['longDescription']
        new_trail.is_reservation_required = t['isReservationRequired']
        new_trail.season = t['season']
        new_trail.topics = t['topics']
        new_trail.time_of_day_description = t['timeOfDayDescription']
        new_trail.location_description = t['locationDescription']
        new_trail.pets_description = t['petsDescription']
        new_trail.duration_description = t['durationDescription']
        new_trail.latitude = t['latitude']
        new_trail.activity_description = t['activityDescription']
        new_trail.activities = t['activities']
        new_trail.url = t['url']
        new_trail.longitude = t['longitude']
        new_trail.reservation_description = t['reservationDescriptio']
        new_trail.are_pets_permitted = t['arePetsPermitted']
        new_trail.duration = t['duration']
        new_trail.related_organizations = t['relatedOrganizations']
        new_trail.location = t['location']
        new_trail.fee_description = t['feeDescription']
        new_trail.do_fees_apply = t['doFeesApply']
        new_trail.title = t['title']
        new_trail.images = t['images']
        new_trail.time_of_day = t['timeOfDay']
        new_trail.season_description = t['seasonDescription']
        new_trail.nps_things_to_do_id = t['id']
        new_trail.are_pets_permitted_with_restrictions = t['arePetsPermittedwithRestrictions']
        new_trail.age_description = t['ageDescription']
        new_trail.related_parks = t['relatedParks']
        new_trail.accessibility_information = t['accessibilityInformation']
        new_trail.age = t['age']
        new_trail.save

        t['tags'].each do |tag|
          activity_tag = Tag.find_or_create_by(value: tag)
          new_trail.tags << activity_tag
          new_trail.save
        end

      end
    end
  end






end
