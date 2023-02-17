# We call it app/views/books/index.html.erb Name the view to match the controller action. 

def index 
	books = Book.all
	#render json: books
	render :index #this is the HTML file. 
end

# Any instance variable within the instance method, is available to to the instance view. ERB allows you to use Ruby code in the HTML. 
=begin
<% Ruby code that will not be printed %> 
<% ruby code that we want to render %>

<ul>
<% @books.each do |book| %>
		<li><%= book.title %></li>
<% end %>
<ul> 

When you want a controller to refer to another method, use the redirect_to books_url.

Note redirect and render are not equivalent to return. You cannot double render. 

In Rails you need a hidden index for PATCH requests. 