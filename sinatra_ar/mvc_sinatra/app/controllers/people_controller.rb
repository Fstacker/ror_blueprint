
##  GET STATEMENTS -------------------------------------------------------
#get request to retrieve all people in the Person class in the database
get '/people' do
	@people = Person.all
	erb :"/people/index"
end

get '/people/new' do 
	@person = Person.new
	erb :"/people/new"
end

post '/people' do 
	if params[:birthdate].include?("-")
		birthdate = params[:birthdate]
	else
		birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
	end
	
	@person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate])
	redirect "people/#{@person.id}"
end

get '/people/:id/edit' do 
	@person = Person.find(params[:id])
	erb :'/people/edit'
end

#method to update and edit a person's record
put '/people/:id' do
	@person = Person.find(params[:id])
	@person.first_name = params[:first_name]
	@person.last_name = params[:last_name]
	@person.birthdate = params[:birthdate]
	@person.save
	redirect "/people/#{@person.id}"
end

#method and route to delete a record
delete '/people/:id' do 
	person = Person.find(params[:id])
	person.delete
	redirect "/people"
end

get '/people/:id' do
	@person = Person.find(params[:id])
	birth_path_num = Person.get_birth_path_num(@person.birthdate.strftime("%m%d%Y"))
  	@message = Person.get_message(birth_path_num)
	erb :"/people/show"
end

=begin
#retrieve the birthpath number of the person from the Person class and convert the date to a readable string
get '/people/:id' do 
	@person = Person.find(params[:id])
	birthdate_string = @person.birthdate.strftime("%m%d%y")
	birth_path_num = Person.get_birth_path_num(birthdate_string)
	@message = Person.get_message(birth_path_num)
	erb :"/people/show"
end
=end