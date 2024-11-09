# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

def import_csv(model, file_path, attributes)
  ActiveRecord::Base.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      data = attributes.map { |attr, csv_column| [attr, row[csv_column]] }.to_h
      model.find_or_create_by(data)
    end
  end
end

import_csv(Crossing, 'db/csv/crossing_kanto.csv', {
  crossing_id: 'id',
  latitude: 'lat',
  longitude: 'lon',
  crossing_name: 'name'
})

import_csv(Prefecture, 'db/csv/prefecture_kanto.csv', {
  prefecture_id: 'pre_code',
  prefecture_name: 'prefecture'
})

import_csv(City, 'db/csv/city_kanto.csv', {
  city_id: 'city_code',
  city_name: 'city'
})

import_csv(Railway, 'db/csv/railway_kanto.csv', {
  railway_id: 'railway_id',
  railway_name: 'railway_name'
})

import_csv(CrossingPrefecture, 'db/csv/crossing_prefecture_kanto.csv', {
  crossing_id: 'id',
  prefecture_id: 'pre_code'
})

import_csv(CrossingCity, 'db/csv/crossing_city_kanto.csv', {
  crossing_id: 'id',
  city_id: 'city_code'
})

import_csv(CrossingRailway, 'db/csv/crossing_railway_kanto.csv', {
  crossing_id: 'id',
  railway_id: 'railway_id'
})