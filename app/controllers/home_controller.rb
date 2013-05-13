class HomeController < ActionController::Base
  protect_from_forgery

  def index
    @test_location = request.location
    @test_land_path = session[:landmark_path]


    # Determine our location
    # first see if we are told the coords, then try the IP lookup, then default to the Empire State Building
    lat = params[:lat] || (request.location.latitude != 0 ? request.location.latitude : nil) || 40.7483
    lng = params[:lng] || (request.location.longitude != 0 ? request.location.longitude : nil) || -73.9855

    # Prep the landmark path
    # also reboot the path if our location has changed
    if !session[:landmark_path] || (lat != session[:lat] || lng != session[:lng])
      # Set up the session coords and update if they've changed
      session[:lat] = lat
      session[:lng] = lng

      # Grab the landmarks and sort by distance to where we are
      landmarks = Landmark.near([lat, lng], 5).limit(20) # https://github.com/alexreisner/geocoder
      session[:landmark_path] = landmarks.collect{|lm| lm.slug} # create a path
    end
  
    # Prep the current landmark
    num_landmarks = session[:landmark_path].length # determine how many landmarks we're dealing with
    session[:current_landmark_slug] = params[:specific_landmark_slug] || session[:landmark_path].first
    @cur_landmark = Landmark.find_by_slug(session[:current_landmark_slug]) # lookup the current landmark

    # Prep the next and prior landmarks
    index_on_landmark_path = session[:landmark_path].index(session[:current_landmark_slug])
    @next_landmark_slug = session[:landmark_path][(index_on_landmark_path+1)%num_landmarks] # increment on the path
    @prior_landmark_slug = session[:landmark_path][(index_on_landmark_path-1)%num_landmarks] # decrement on the path
  end
end
