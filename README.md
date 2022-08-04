<h1 align="center">The List</h1>
<p align="center">
  <img src="https://user-images.githubusercontent.com/98491210/181646573-c49f9559-b3e3-426e-b924-65c7ff6783cf.jpeg" />
</p>

<!-- TABLE OF CONTENTS -->
  <details>
  <summary>Table of Contents</summary>
  <ol>
    </li>
    <li><a href="#project-overview">Project Overview</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#setup">Setup</a></li>
    <li><a href="#user-walkthrough">User Walkthrough</a></li>
    <li><a href="#api-endpoints">API Endpoints</a></li>
    <li><a href="#contributors">Contributors</a></li>
  </ol>
</details>

<!-- PROJECT OVERVIEW -->
## Project Overview
Has a friend ever recommended an amazing movie to you, only for you to immediately forget about it?  Have you ever read an incredible book you swear someone suggested, but you can't remember who to thank? **The List** is here to help.  Browse thousands of movies and books, personally recommend them to your friends, and store media recommendations made to you all within one convenient user interface!<br>
<br>**Visit the app on [heroku](https://the-list-fe.herokuapp.com)** :atom_symbol:<br>
<br>**Check out the corresponding back-end [repo](https://github.com/CKjolhede/Consultancy_The_List_BE)** :clipboard: <br>

<!-- Built With -->
## Built With
[<img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"/>](https://www.ruby-lang.org/en/) **Version 2.7.4**<br>
[<img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>](https://rubyonrails.org/) **Version 5.2.8**<br>
<img src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white"/><br>
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white"/><br>
[<img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white"/>](https://getbootstrap.com)<br>
[<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>](https://www.postman.com/product/what-is-postman/)<br>

<!-- Setup -->
## Setup
To set up the project on your local machine, complete the following steps:
1. Ensure you have the correct versions of both Ruby(2.7.4 or later) and Rails(5.2.8 or later) by running `ruby -v` and `rails -v` from your command line.<br>
2. Register for free API key [here](https://developers.themoviedb.org/3/getting-started/introduction).
3. Clone the repo:
```git clone git@github.com:wesatt/consultancy_the_list_fe.git``` &mdash; for SSH
4. Install gems and dependencies:
```bundle install```
5. Configure API key by first running `bundle exec figaro install` in your command line and then configuring your API key in your `application.yml` file:
```ruby
movie_api_key: your_key_here
```
6. Authentication: Additional information about `gem 'omniauth-google-oauth2'` can be found [here](https://github.com/zquestz/omniauth-google-oauth2).

<!-- User Walkthrough -->
## User Walkthrough
![welcome](https://user-images.githubusercontent.com/98491210/182743310-0dd98412-18ea-4fd1-a9fb-1a966cfebd34.png)<br>
**The List** uses [Google Oauth 2.0](https://developers.google.com/identity/protocols/oauth2) to authenticate its users.  A new user will be prompted to enter their Gmail account and password in order to access and sign in to **The List**. Once signed in, the user will land on their dashboard, which displays various media recommendations, by whom they were recommended, and a personal watchlist.<br>
<br><img width="557" alt="Screen Shot 2022-08-04 at 2 24 40 PM" src="https://user-images.githubusercontent.com/98491210/182946034-057da56c-27f6-4752-8753-d90ecb98f6d4.png"><br>
<br>From the dashboard, a user can navigate to a search page, where they can search for media to add to their watchlist or
recommend to other users.<br>
<br><img width="553" alt="movie search" src="https://user-images.githubusercontent.com/98491210/182936752-f608b18e-19eb-4daa-b826-44a858689d97.png"><br>
<br>After searching for either a book or a movie, a user will be able to browse all the results, click the link for that particular media, and see additional information.  The user is able to recommend this media to other users from this page.<br>
<br><img width="567" alt="movie show" src="https://user-images.githubusercontent.com/98491210/182937648-51ee974e-6e9d-4b0c-8e83-73f429011dc3.png"><br>

<!-- API Endpoints -->
## API Endpoints
**The List** consumes several API's, including our own, built from the ground up back-end, [TheListAPI](https://github.com/CKjolhede/Consultancy_The_List_BE). Additionally, **The List** consumes the following two external API's for media data:<br><br>
![Screen Shot 2022-08-03 at 10 27 13 AM](https://user-images.githubusercontent.com/98491210/182660517-d3274016-d90f-4161-9d7c-846b19827335.png)<br>
Documentation [here](https://developers.themoviedb.org/3/getting-started/introduction).<br>
<br>
![Screen Shot 2022-08-03 at 10 52 11 AM](https://user-images.githubusercontent.com/98491210/182665170-c912ce12-d1d4-4c27-a64f-ebaa30bea1a9.png)<br>
Documentation [here](https://developers.google.com/books/docs/viewer/developers_guide).<br>

<!-- CONTRIBUTORS -->
## Contributors
### Back-end Team
Eric Espindola Chavez &mdash; [Github](https://github.com/erock02) • [LinkedIn](https://www.linkedin.com/in/eric-espindola-b9620a158/)<br>
Chris Kjolhede &mdash; [Github](https://github.com/CKjolhede) • [LinkedIn](https://www.linkedin.com/in/chris-kjolhede/)<br>
Becky Nisttahuz &mdash; [Github](https://github.com/benistta) • [LinkedIn](https://www.linkedin.com/in/becky-nisttahuz/)<br>

### Front-end Team
Deannah Burke &mdash; [Github](https://github.com/deannahburke) • [LinkedIn](https://www.linkedin.com/in/deannah-burke/)<br>
Wesley Garcia &mdash; [Github](https://github.com/wesatt) • [LinkedIn](https://www.linkedin.com/in/wesley-garcia-attech/)<br>
Sai Hall &mdash; [Github](https://github.com/SaiHall) • [LinkedIn](https://www.linkedin.com/in/sai-hall-503710237/)<br>

### Instructor/Project Manager
Jamison Ordway
