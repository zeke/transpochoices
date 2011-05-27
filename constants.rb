CALORIES_PER_SECOND_WALKING = 8/60.0  #dietary calories / sec
CALORIES_PER_SECOND_SITTING = 1.4/60.0 #dietary calories / sec
CALORIES_PER_KM_BIKING = 24 #dietary calories / km
BIKE_SPEED_IN_KM_PER_SECOND = 14 / 3600.0 #30 km/h into km/sec
CAMRY_MILEAGE = 35.406 #km / gallon
EMISSIONS_PER_GALLON = 8.788 #kg CO2/gallon gasoline
DOLLARS_PER_GALLON = 4.147 #USD
AAA_COST_PER_KM = 0.356 #USD/km
BIKING_COST_PER_KM = 0.07146 #USD/km

GTFS_MAPPING = {
	"San Francisco Municipal Transportation Agency"=>["MUNI_google_transit","SFMTA"],
	"Bay Area Rapid Transit"=>["BART_google_transit","BART"],
	"AirBART"=>["BART_google_transit","AirBART"]
}


TAXI_RATES = [{:lat=>42.3584308,
  :per_km=>4.5061632,
  :per_hour_waiting=>28.0,
  :initial_increment_km=>0.22990628571428573,
  :initial_charge=>2.6,
  :city=>"Boston"},
 {:lat=>39.114053,
  :per_km=>3.3796224000000006,
  :per_hour_waiting=>40.0,
  :initial_increment_km=>0.16093440000000003,
  :initial_charge=>2.5,
  :city=>"Kansas City"},
 {:lat=>36.114646,
  :per_km=>4.184294400000001,
  :per_hour_waiting=>30.0,
  :initial_increment_km=>0.12379569230769233,
  :initial_charge=>3.3,
  :city=>"Las Vegas"},
 {:lat=>34.0522342,
  :per_km=>3.9428928000000005,
  :per_hour_waiting=>26.53,
  :initial_increment_km=>0.22990628571428573,
  :initial_charge=>2.65,
  :city=>"Los Angeles"},
 {:lat=>43.0389025,
  :per_km=>4.02336,
  :per_hour_waiting=>21.0,
  :initial_increment_km=>0.16093440000000003,
  :initial_charge=>2.75,
  :city=>"Milwaukee"},
 {:lat=>21.3069444,
  :per_km=>3.8624256,
  :per_hour_waiting=>27.0,
  :initial_increment_km=>0.201168,
  :initial_charge=>2.25,
  :city=>"Honolulu"},
 {:lat=>39.952335,
  :per_km=>3.7014912,
  :per_hour_waiting=>30.0,
  :initial_increment_km=>0.22990628571428573,
  :initial_charge=>2.7,
  :city=>"Philadelphia"},
 {:lat=>37.7749295,
  :per_km=>3.6210240000000002,
  :per_hour_waiting=>27.0,
  :initial_increment_km=>0.32186880000000007,
  :initial_charge=>3.1,
  :city=>"San Francisco"},
 {:lat=>28.5383355,
  :per_km=>4.02336,
  :per_hour_waiting=>22.5,
  :initial_increment_km=>0.0,
  :initial_charge=>3.0,
  :city=>"Orlando"},
 {:lat=>32.7153292,
  :per_km=>4.184294400000001,
  :per_hour_waiting=>20.0,
  :initial_increment_km=>0.16093440000000003,
  :initial_charge=>2.4,
  :city=>"San Diego"},
 {:lat=>39.7391536,
  :per_km=>3.6210240000000002,
  :per_hour_waiting=>22.5,
  :initial_increment_km=>0.178816,
  :initial_charge=>2.5,
  :city=>"Denver"},
 {:lat=>25.7889689,
  :per_km=>3.8624256,
  :per_hour_waiting=>24.0,
  :initial_increment_km=>0.268224,
  :initial_charge=>2.5,
  :city=>"Miami"},
 {:lat=>45.5234515,
  :per_km=>4.02336,
  :per_hour_waiting=>15.0,
  :initial_increment_km=>0.16093440000000003,
  :initial_charge=>2.5,
  :city=>"Portland"},
 {:lat=>44.9799654,
  :per_km=>3.7819584000000006,
  :per_hour_waiting=>24.0,
  :initial_increment_km=>0.32186880000000007,
  :initial_charge=>2.5,
  :city=>"Minneapolis"},
 {:lat=>47.6062095,
  :per_km=>3.218688,
  :per_hour_waiting=>30.0,
  :initial_increment_km=>0.0,
  :initial_charge=>2.5,
  :city=>"Seattle"},
 {:lat=>40.7143528,
  :per_km=>3.218688,
  :per_hour_waiting=>24.0,
  :initial_increment_km=>0.32186880000000007,
  :initial_charge=>2.5,
  :city=>"New York"},
 {:lat=>42.331427,
  :per_km=>3.6210240000000002,
  :per_hour_waiting=>24.0,
  :initial_increment_km=>0.201168,
  :initial_charge=>3.0,
  :city=>"Detroit"},
 {:lat=>33.7489954,
  :per_km=>3.218688,
  :per_hour_waiting=>21.0,
  :initial_increment_km=>0.201168,
  :initial_charge=>2.5,
  :city=>"Atlanta"},
 {:lat=>41.4994954,
  :per_km=>3.6049305600000006,
  :per_hour_waiting=>18.0,
  :initial_increment_km=>0.201168,
  :initial_charge=>2.75,
  :city=>"Cleveland"},
 {:lat=>40.7607793,
  :per_km=>3.5405568000000005,
  :per_hour_waiting=>22.0,
  :initial_increment_km=>0.14630400000000002,
  :initial_charge=>2.2,
  :city=>"Salt Lake City"},
 {:lat=>33.4483771,
  :per_km=>2.8968192000000004,
  :per_hour_waiting=>19.8,
  :initial_increment_km=>0.0,
  :initial_charge=>2.5,
  :city=>"Phoenix"},
 {:lat=>39.2903848,
  :per_km=>2.8968192000000004,
  :per_hour_waiting=>24.0,
  :initial_increment_km=>0.0,
  :initial_charge=>2.0,
  :city=>"Baltimore"},
 {:lat=>29.7628844,
  :per_km=>3.0094732800000004,
  :per_hour_waiting=>20.0,
  :initial_increment_km=>0.29260800000000003,
  :initial_charge=>2.5,
  :city=>"Houston"},
 {:lat=>41.8781136,
  :per_km=>2.8968192000000004,
  :per_hour_waiting=>20.0,
  :initial_increment_km=>0.178816,
  :initial_charge=>2.25,
  :city=>"Chicago"},
 {:lat=>32.802955,
  :per_km=>2.8968192000000004,
  :per_hour_waiting=>18.0,
  :initial_increment_km=>0.178816,
  :initial_charge=>2.25,
  :city=>"Dallas"},
 {:lat=>40.4406248,
  :per_km=>2.816352,
  :per_hour_waiting=>9.0,
  :initial_increment_km=>0.22990628571428573,
  :initial_charge=>2.25,
  :city=>"Pittsburgh"},
 {:lat=>38.8951118,
  :per_km=>2.414016,
  :per_hour_waiting=>15.0,
  :initial_increment_km=>0.268224,
  :initial_charge=>3.0,
  :city=>"Washington"},
 {:lat=>38.646991,
  :per_km=>2.7358848,
  :per_hour_waiting=>22.0,
  :initial_increment_km=>0.16093440000000003,
  :initial_charge=>2.5,
  :city=>"St. Louis"}]