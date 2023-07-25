restore table it_census from 'it_census.dmp.gz' with (s3_region='us-west-1');
restore table it_poi_osm_1k from 'it_poi_osm_1k.dmp.gz' with (s3_region='us-west-1');
restore table it_poi_osm from 'it_poi_osm.dmp.gz' with (s3_region='us-west-1');
restore table nyc_buildings_centroid from 'nyc_buildings_centroid.dmp.gz' with (s3_region='us-west-1');
restore table nyc_taxi_201406 from 'nyc_taxi_201406.dmp.gz' with (s3_region='us-west-1');
restore table nyc_taxi_zones from 'nyc_taxi_zones.dmp.gz' with (s3_region='us-west-1');
restore table us_zip_codes from 's3//heavyai/KB_GeospatialJoins/us_zip_codes.dmp.gz' with (s3_region='us-west-1');
