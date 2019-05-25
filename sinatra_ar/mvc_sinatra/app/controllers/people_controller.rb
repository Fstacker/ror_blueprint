
#get request to retrieve all people in the Person class in the database
get '/people' do
	@people = Person.all
	erb :"/people/index"
end

#retrieve the birthpath number of the person from the Person class and convert the date to a readable string
get '/people/:id' do 
	@person = Person.find(params[:id])
	birthdate_string = @person.birthdate.strftime("%-m/%-d/%y")
	birth_path_num = Person.get_birth_path_num(birthdate_string)
	@message = Person.get_message(birth_path_num)
	erb :"/people/show"
end
