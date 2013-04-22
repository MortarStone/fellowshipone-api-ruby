#!/usr/bin/ruby

#
# Example code to query all people on F1
#

require File.dirname(__FILE__) + '/../lib/fellowship_one'
require FELLOWSHIPONE_LIB_DIR + '/search'
require FELLOWSHIPONE_LIB_DIR + '/people'

peep = FellowshipOne::People.new
pers = FellowshipOne::Person.new

alpha_from = "h"
alpha_to = "h"

alpha = alpha_from + "a"
omega = alpha_to + "b"

# # Example to return list of all user IDs in an array. 
# # 
# people_id_list = peep.get_all_people_ids(alpha,omega) #call with no args to list all people, A-Z
# # people_list will be an array of all people IDs
# puts people_id_list.inspect

# # Example to return list of all household IDs in an array
# #
# household_id_list = peep.get_all_household_ids(alpha,omega) #call with no args to list all households, A-Z
# # household_list will be an array of all household IDs
# puts household_id_list.inspect


# Example to return a list, and build an array of Person objects
# Still a work in progress. List is not unique (e.g., there may be dups)
#
a = []
person_list = peep.get_all_people_by_object(alpha,omega)

person_list.each do |x|
	x["results"]["person"].each do |y|
		a << FellowshipOne::Person.new(y)
	end
end
puts a.inspect
# # just to see what is in the list
# #
# a.each do |px|
# 	#puts x.inspect
# 	puts px.first_name + ", " + px.last_name
# end

# puts a.size

