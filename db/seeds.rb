# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

def import_csv(model, file_path, attributes, unique_by:)
  ActiveRecord::Base.transaction do
    now = Time.zone.now
    timestamps = { created_at: now, updated_at: now }
    file = File.read(file_path)
    records = CSV.parse(file, headers: true).map do |row|
      data = attributes.map { |attr, csv_column| [attr, row[csv_column]] }.to_h.symbolize_keys
      data.merge(timestamps)
    end
    model.upsert_all(records, unique_by: unique_by)
  end
end

import_csv(
  Crossing,
  'db/csv/crossing_kanto.csv',
  {
  crossing_id: 'id',
  latitude: 'lat',
  longitude: 'lon',
  crossing_name: 'name',
  city_id: 'city_code'
  },
  unique_by: :crossing_id
  )

import_csv(
  Prefecture,
  'db/csv/prefecture_kanto.csv',
  {
  prefecture_id: 'pre_code',
  prefecture_name: 'prefecture'
  },
  unique_by: :prefecture_id
  )

import_csv(
  City,
  'db/csv/city_kanto.csv',
  {
  city_id: 'city_code',
  city_name: 'city',
  prefecture_id: 'pre_code'
  },
  unique_by: :city_id
  )

import_csv(
  Railway,
  'db/csv/railway_kanto.csv',
  {
  railway_id: 'railway_id',
  railway_name: 'railway_name'
  },
  unique_by: :railway_id
  )

import_csv(
  CrossingRailway,
  'db/csv/crossing_railway_kanto.csv',
  {
  crossing_id: 'id',
  railway_id: 'railway_id'
  },
  unique_by: :id
  )