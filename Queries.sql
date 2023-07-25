-- Point in polygon queries 
-- Joining millions points of interest of the entire country with 400k census sections
select count(*) from it_poi_osm join it_census on st_contains(it_census.geom, it_poi_osm.geom);
select count(*) from it_poi_osm join it_census on st_intersects(it_census.geom, it_poi_osm.geom);
-- Joining a small number of radnomly placed poi with 400k census sections
select count(*) from it_poi_osm_1k join it_census on st_contains(it_census.geom, it_poi_osm_1k.geom);
select count(*) from it_poi_osm_1k join it_census on st_intersects(it_census.geom, it_poi_osm_1k.geom);
-- Joining 13 Million of taxi rides in NYC with taxi zones
select count(*) from nyc_taxi_201406 join nyc_taxi_zones on st_contains(nyc_taxi_zones.geom, nyc_taxi_201406.pickup);
select count(*) from nyc_taxi_201406 join nyc_taxi_zones on st_intersects(nyc_taxi_zones.geom, nyc_taxi_201406.pickup);
-- Joining just 100k of taxi rides in NYC with taxi zones
select count(*) from nyc_taxi_201406_100k join nyc_taxi_zones on st_intersects(nyc_taxi_zones.geom, nyc_taxi_201406_100k.pickup);
select count(*) from nyc_taxi_201406_100k join nyc_taxi_zones on st_intersects(nyc_taxi_zones.geom, nyc_taxi_201406_100k.pickup);

-- Point to Point distance (range join)
-- Checking which buildings are in a range of approx 10/1000/1000 meters from the pickup point of taxi rides
select count(*) from nyc_taxi_201406 join nyc_buildings_centroid on st_distance(nyc_taxi_201406.pickup,nyc_buildings_centroid.building_point) < 0.0001;
select count(*) from nyc_taxi_201406 join nyc_buildings_centroid on st_distance(nyc_taxi_201406.pickup,nyc_buildings_centroid.building_point) < 0.001;
select count(*) from nyc_taxi_201406 join nyc_buildings_centroid on st_distance(nyc_taxi_201406.pickup,nyc_buildings_centroid.building_point) < 0.01;

-- Polygon to Polygon Intersects
-- Checking which building on NYC cross taxi zones
select count(*) from nyc_buildings join nyc_taxi_zones on st_intersects(nyc_buildings.geom,nyc_taxi_zones.geom);
-- Checking how many buildings of NYC intersects the census sections of the entire countries
select count(*) from nyc_buildings join us_zip_codes on st_intersects(nyc_buildings.geom,us_zip_codes.geom);
-- Checking how many buildings of NYC intersects the census sections of NYC are only
select count(*) from nyc_buildings join nyc_zip_codes on st_intersects(nyc_buildings.geom,nyc_zip_codes.geom);
