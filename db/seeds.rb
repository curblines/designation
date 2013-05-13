# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Landmark.create([
  {
    name: "Morningside Park", 
    description: "Morningside Park is a significant park in New York ...", 
    lpc_type: "scenic_landmark", 
    tags: ["park"], 
    founders: ["Frederick Law Olmsted", "Calvert Vaux"], 
    lat: 40.8055, 
    lng: -73.9591, 
    inception: "1873-01-01 00:00:00", 
    designation: "2007-04-10 00:00:00",
    slug: "morningside-park"
  },
  {
    name: "Bryant Park", 
    description: "Bryant Park is a prime example of the small axial park with a central green and peripheral walks, designed in the French classical tradition", 
    lpc_type: "scenic_landmark", 
    tags: ["park"], 
    founders: [], 
    lat: 40.7538, 
    lng: -73.9832, 
    inception: "1884-05-12 00:00:00", 
    designation: "1974-11-12 00:00:00",
    slug: "bryant-park"
  },
  {
    name: "Central Park", 
    description: "Central Park is a public park at the center of Manhattan in New York City. The park initially opened in 1857, on 778 acres (315 ha) of city-owned land (it is 843 acres today). In 1858, Frederick Law Olmsted and Calvert Vaux won a design competition to improve and expand the park with a plan they entitled the Greensward Plan. Construction began the same year, continued during the American Civil War, and was completed in 1873. Central Park is the most visited urban park in the United States.", 
    lpc_type: "scenic_landmark", 
    tags: ["park"], 
    founders: ["Frederick Law Olmsted", "Calvert Vaux"], 
    lat: 40.7738, 
    lng: -73.9711, 
    inception: "1857-01-01 00:00:00", 
    designation: "1974-03-26 00:00:00",
    slug: "central-park"
  }
])
