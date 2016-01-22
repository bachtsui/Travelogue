# Travelouge

Travelouge is community user driven blog website used to share tips, experience, and stories about their favorite locations around the world!

### Sprints
**Sprint 1: Create a website with basic user sign up capabilities.**
1. Navigate to "/" and see a basic splash page with:
  * The name of the website.
  * Links to "Log In" and "Sign Up".
2. Sign up for an account.
1. Log in to their account if they already have one.
1. Be redirected to their public profile page after logging in.
1. On their public profile page, see their name, the current city they have set in their profile, and their join date.
1. See the site-wide header on every page with:
  * A link to "Log Out" if they're logged in.
  * Links to "Log In" and "Sign Up" if they're logged out.
7. Update their profile by making changes to their name and/or current city.
1. See the titles of all the posts they've contributed (start with pre-seeded data).
1. Click on the title of one of their posts and be redirected to a "show" page for that post.
1. View post "show" pages with title, author, and content.

**Sprint 2: Functionality with Cities and Posts**
1. View the "San Francisco" page (at "/cities/1") including:
  * The site-wide header.
  * The name of the city.
  * An iconic photo of the city.
2. View a list of posts on the San Francisco page:
  * Sorted by newest first.
  * With the post titles linked to the individual post "show" pages.
3. Use an "Add New Post" button on the San Francisco city page to pull up the new post form.
1. Create a new post for San Francisco (**Hint:** <a href="http://guides.rubyonrails.org/routing.html#nested-resources" target="_blank">nested resources</a>).
1. Click "Edit" on ANY individual post, and be redirected to the edit form.
1. Click "delete" on ANY individual post, then:
  * See a pop-up that says: "Are you sure you want to delete #{title}?"
  * If the user confirms, delete the post.

**Sprint 3: Validations & Authorization**
1. View city pages for "London" and "Gibraltar".
1. Verify that a new post they create is successfully published on the correct city page.

A user is authorized to perform certain actions on the site, according to the following rules:

3. A user MUST be logged in to create/update/destroy resources.
1. A user may only edit their own profile and edit/delete their own posts.

### Code Snippets

**Alex**

City Show Page
```ruby
     <% if current_user == article.user %>
      <div class = "button">
        <%= link_to "edit", edit_article_path(article.id), class: 'btn btn-light' %>
      </div>
      <div class = "button">
        <%= button_to "remove", article_path(article)  %>
      </div></br>
      <% end %>
```

**Colbert**

City Show Page
```ruby
 <%= button_to "remove", article_path(article), { method: :delete, data: {confirm: "Are you sure you want to delete '#{article.title}'?"}, class: 'btn btn-light'} %>
 ```

**IS**

Article Controller
```ruby
def create
    # @article = current_user.articles.new(article_params) 
    @article = Article.new(article_params)
    current_user.articles << @article
    # current_city.articles << @article
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to article_path(@article)
    else
      flash[:error] = @article.errors.full_messages.join(", ")
      redirect_to new_article_path
    end
  end
```
Routes
```ruby
get "/users/:last_name/articles/:id", to: "articles#show", as: "user_article"
get "/cities/:name/articles/:id", to: "articles#show", as: "city_article"
```

To Be Figured Out
```ruby
get "/users/:last_name, to: "users#show", as: "user_name"
get "/users/:name, to: "cities#show", as: "city_name"
```

**Doug**

Git and Github Experience

On local master branch, DO NOT DO THIS
```bash
git pull origin feature_branch
```
Be Alert in Resolving Merge Conflicts
```ruby
<<<<<<<<HEAD
========
.city_show_title:hover {
  opacity: .99;
  text-decoration: none;
>>>>>>>>>>
a:-webkit-any-link {
  text-decoration: none;
}

#notice {
  margin: 50px;
}
```
When merging multiple feature branches, merge each feature branch into the master individually.

### Technology Used
* Ruby On Rails 
* bcrypt
* ffaker
* Heroku
* Git + Github
* RESTful Routes
* HTML5
* CSS

### Installation
1. Fork and Clone Repo
```bash
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
```
2. Go to localhost:3000 in Browser

### Link to Heroku

This application is deployed on heroku [here](https://travelogueone.herokuapp.com/).

### Features to Implement
1. Add More Cities
2. Add Geotags
3. Cannot sign up with an existing email address
4. Post Title must be within 200 Characters

### Contributers
[Is Angieri](https://github.com/isangieri)
[Colbert Tse](https://github.com/trebloc)
[Alex Rao](https://github.com/alexpsu)
[Doug Tsui](https://github.com/bachtsui)




   
 