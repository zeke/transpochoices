require 'csv'
require 'bigdecimal'
require 'set'

$csv_cache={}
def csv_to_hash(file)
	$csv_cache[file] ||= read_csv_to_hash(file)
end

def read_csv_to_hash(file)
	csv = CSV.read(file)
	headers = csv.shift
	csv.map do |row|
		Hash[*headers.zip(row).flatten]
	end
end

class String
	def close_to?(other)
		self.downcase.gsub(/\W/,'') == other.downcase.gsub(/\W/,'')
	end
end

def best_fare(rides,fares)
	leg_costs = Array.new(rides.length) {Array.new(rides.length)} #2d array by rides length. row-major. (first index is origin, second is destination)
	
	(1..rides.length).each do |leg_length|
		rides.each_cons(leg_length).each_with_index do |rides_in_leg,start|
			straight_cost = best_without_transfers(rides_in_leg,fares)
			split_costs = (1...leg_length).map do |split_point|
				best_without_transfers(rides_in_leg[0..split_point],fares) + 
				best_without_transfers(rides_in_leg[split_point..-1],fares)
			end
			leg_costs[start][start+leg_length] = ([straight_cost]+split_costs).compact.min
		end
	end
	
	leg_costs[0].last || 99.99 #or something intelligent, if there's no valid fare
end

def best_without_transfers(rides,fares)
	fares.select {|f| f.matches? rides}.map(&:price).min
end

class Fare
	#attributes
	attr_accessor :agency_id, :fare_id, :price, :currency, :payment_method, :rules_specified
	#rules
	attr_accessor :transfers, :transfer_duration
	attr_accessor :covered_routes, :zone_pairs, :contained_zones
	
	def initialize(args_hash)
		args_hash.each do |k,v|
			self.instance_variable_set("@#{k}".to_sym,v)
		end
		
		@price = BigDecimal.new(@price) if @price
		@transfer_duration = @transfer_duration.to_i if @transfer_duration
		@transfers = @transfers.to_i if @transfers
		
		if @rules_specified
			@covered_routes ||= []
			@zone_pairs ||= []
			@contained_zones ||=[]
		end
	end
	
	def matches?(rides)
		return false if @transfers && rides.length > (transfers+1)
		return false if @transfer_duration && (rides.last.end_time - rides.first.start_time) > @transfer_duration
		
		return true if !@rules_specified
		#puts "checking matches. me = #{self.inspect}. rides = #{rides[0].inspect}, #{(@covered_routes.empty? || rides.map(&:route).to_set.subset?(@covered_routes))}, #{(@zone_pairs.empty? || @zone_pairs.find {|(origin,destination)| (origin.nil? || origin==rides.first.origin) && (destination.nil? || destination==rides.last.destination)})}, #{(@contained_zones.empty? || rides.map {|r| [r.origin,r.destination]}.flatten.to_set == @contained_zones)}"
		return (@covered_routes.empty? || rides.map(&:route).to_set.subset?(@covered_routes)) &&
			(@zone_pairs.empty? || @zone_pairs.find {|(origin,destination)| (origin.nil? || origin==rides.first.origin) && (destination.nil? || destination==rides.last.destination)}) &&
			(@contained_zones.empty? || rides.map {|r| [r.origin,r.destination]}.flatten.to_set == @contained_zones)
	end
	
	def self.load(attributes_file,rules_file=nil)
		fare_attributes = csv_to_hash(attributes_file)
		
		if rules_file
			rules = csv_to_hash(rules_file).group_by {|r| r["fare_id"]}
		end
		
		return fare_attributes.map do |attributes|
			attributes.merge!({:rules_specified => !!rules_file})
			
			fare = self.new(attributes)
			
			if rules
				my_rules = rules[fare.fare_id]
				if my_rules
					fare.covered_routes = my_rules.map {|r| r["route_id"]}.to_set.delete(nil)
					fare.zone_pairs = my_rules.map {|r| [r["origin_id"],r["destination_id"]]}.to_set.delete([nil,nil])
					fare.contained_zones = my_rules.map {|r| r["contains_id"]}.to_set.delete(nil)
				else
					fare.rules_specified=false
				end
			end
			fare
		end.group_by {|fare| fare.agency_id}
	end
end

class Ride
	attr_accessor :start_time, :end_time, :origin, :destination, :route
	def initialize(args_hash)
		args_hash.each do |k,v|
			self.instance_variable_set("@#{k}".to_sym,v)
		end
	end
end