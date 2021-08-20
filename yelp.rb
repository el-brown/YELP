# a resturuant looks like this
# res_data = {
#   id: INTEGER *MUST BE UNIQUE,
#   name: STRING,
#   location: {
#     city: STRING,
#     state: STRING,
#   },
#   delivery: BOOLEAN,
#   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES) ie 'mon,tue,wed',
#   likes: INTEGER,
#   dishes: ARRAY OF OBJECTS/HASHES
#     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
#   ],
#   reviews: ARRAY OF HASHES [
#     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
#   ]
# }


user1 = {
  id: 1,
  name: "Tony",
}
user2 = {
  id: 2,
  name: "Sally",
}
res1 = {
  id: 1,
  name: "Spicy Thai",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: true,
  days_open: "mon,tues,wed,thur,fri,sat,sun",
  likes: 1000,
  dishes: [
    { name: "Pad Thai", price: 10.25, ingredients: ["noddles", "peppers"] },
    { name: "Drunken Noodle", price: 9.25, ingredients: ["noddles", "chicken"] },
  ],
  reviews: [
    { user_id: 1, rating: 5 },
    { user_id: 2, rating: 3 },
  ],
}
res2 = {
  id: 2,
  name: "Albertos",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: false,
  days_open: "mon,tues,wed,thur,fri,sat",
  likes: 500,
  dishes: [
    { name: "Tacos", price: 8.25, ingredients: ["tortilla", "carne"] },
    { name: "Quesidalla", price: 9.25, ingredients: ["tortilla", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 2 },
    { user_id: 2, rating: 4 },
  ],
}

res3 = {
  id: 3,
  name: "Viva Chicken",
  location: {
    city: "Saint George",
    state: "UT",
  },
  delivery: true,
  days_open:'tue,wed,thur,fri,sat,sun',
  likes: 3000,
  dishes: [
    { name: "Limena Salad", price: 8.95, ingredients: ["chickpeas", "kale"] },
    { name: "Naked Peruvian Wrap", price: 10.95, ingredients: ["tortilla", "chicken"] }
  ],
  reviews: [
    {user_id: 1, rating: 5},
    {user_id: 2, rating: 4}
  ]
}

@all_users = [user1, user2]  # Gives me users in one array and makes them Hashes
@all_restaurants = [res1, res2]  # Gives me restaurants in one array and makes them Hashes
@all_restaurants.push(res3)  #Adds my new restaurant to the array as a Hash

list_of_restaurants = @all_restaurants.map do |res| res[:name] end  #Returns a current list of the restaurants


#1 access user1 name through user1
#user1[:name]

# A function to find a user based on their Id.

def user_name(id)
  @all_users.select do |user| 
    if user[:id] == id
      puts user[:name]
    end
  end
end

# # Gets input of user_id and puts out user_name
# puts "Enter the user number: "
# user_id = gets.chomp.to_i
# print "User: " 
# user_name(user_id)


#2 access user1 name through res2 (user1 data is in reviews)
# res2[:reviews][2][:user_id]  

# A function to find which rating a certain user gave restaurant 2. 

def user_rating_res_2(id)
  @all_restaurants[1][:reviews].map do |each| 
    if each[:user_id] == id
      puts each[:rating]
    end
  end
end

# Get user_1 rating for res 2:
# user_rating_res_2(1) 

=begin




#3 access res1 reviews
res1[:reviews]

#5 what does this output res1[:dishes]
# { name: "Pad Thai", price: 10.25, ingredients: ["noddles", "peppers"] },
# { name: "Drunken Noodle", price: 9.25, ingredients: ["noddles", "chicken"] }

#6 print out just the name for res1 dishes (each loop)

res1[:dishes].each do |dish| print "#{dish[:name]} " end

#7 print out just the name for res1 dishes along with ingredients (nested each loop)

res1[:dishes].each do |dish| print "Dish name: #{dish[:name]}. Ingredients: " 
    dish[:ingredients].each do |ingredients| print "#{ingredients} " end
  end

#8 create a function that takes a user and return a string with the users name and id

def get_name_and_id(user)
  return "#{user[:id]}) #{user[:name]}"
end

#9 create a method that takes a res and returns the menu of that res

def res_menu(res)
  res[:dishes]
end

# puts res_menu(res2)

#10 create a function that takes a res and returns average review

def avg_review(res)
  ratings = res[:reviews].map do |review| review[:rating] end
  avg = ratings.sum(0) / ratings.size
end

# p avg_review(res1)

#11 create an array of restaurants and do CRUD actions



#Simple Array CRUD
# restaurants = ["taco bell", "mcdonalds", "burger king"]
# restaurants.push("Wendy's") #Adds Wendy's to the end of the array- CREATE
# restaurants.each do |restaurant| puts restaurant end  #puts out the array- READ
# restaurants.map do |restaurant| restaurant + " is yummy" end  #Changes each restaurant value to include "is yummy" at the end - UPDATE
# restaurants.pop #Pops Wendy's off the end of the array- DELETE
# restaurants.shift #shifts to the left and the first one falls off ("taco bell") -DELETE
# restaurants.unshift("TACO BELL")  #Brings in a value to the front. Taco bell is back with a vengeance - CREATE
# restaurants.clear  #Clears the whole array - DELETE
# restaurants = ["Viva Chicken", "Benja's Thai Garden","The Break"]  #Repopulates the restaurants array with my favorites - CREATE
# restaurants[0] = "Livin la Viva Chicken"  #Takes restaurant at index0 and changes it - UPDATE
# p restaurants  # - READ


#12 loop through your restaurants and return those with likes > 500 (select/filter)

likes_over_500 = all_restaurants.select do |res| res[:likes] > 500 
  end
  likes_over_500.map do |name| puts name[:name] 
  end

#Takes an array of restaurants and loops over them to return the res with more than 500 likes

def over_500_likes(arr)
  likes_over_500 = arr.select do |res| res[:likes] > 500 
  end
  likes_over_500.map do |name| puts name[:name] 
  end
end

#15 I want you to think of ideas simple/hard and through them in slack



# My method to print restaurants that are open certain days

def is_open(day)
  #loop through restaurants to get the restaurants that are open that DAY 
  open_arr = @all_restaurants.select do |res| res[:days_open].include?(day)
  end  #returns an array that only includes res that are open that day. 
  #puts the name of the restaurants that are open that day
  open_arr.map do |name| name[:name]
  end
end

#Gets user input to see which restaurants are open the day they want to eat out
puts "What day would you like to eat out?"
choice = gets.chomp
puts "Open restaurants: #{is_open(choice)}" 
#see if days open includes day
=end
