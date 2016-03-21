class User < ActiveRecord::Base
  has_many :listings, :foreign_key => 'host_id'
  has_many :reservations, :through => :listings
  has_many :guests, through: :listings
  
  has_many :trips, :foreign_key => 'guest_id', :class_name => "Reservation"
  has_many :hosts, through: :trips, source: :listing, foreign_key: :host_id, class_name: "User"

  has_many :reviews, :foreign_key => 'guest_id'
  
  # def hosts
  #   self.trips.select{|r| r.listing.host_id}

  # end


end
