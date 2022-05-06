# JOBHOUSE
## Welcome to the JOBHOUSE API
 + This API was built in conjunction with the [JobHouse_Fe](https://github.com/aedanjames/job_house_fe) Front End application

## Available Endpoints
  + base `/api/v1`

  + Get Jobs index
  + ![get_jobs](app/assets/images/get_jobs_url.png)
    + Returns a list of jobs matching the city param
      + Here we reach into a third party Job board API
      adzuna link goes here
      + ![get_jobs](app/assets/images/get_jobs_response.png)
  + Get `/users?email=someemailadress.com`
    + returns the specific user requested by email address, if one does not exist, creates a new one and returns that user
      + Here we store our user table for our front end program to control access via Google-Oauth2
  + Post `/jobs`
    + takes a formatted param with a `job`key and JSON body
    + creates a job entry in our database,  or locates on if it already exists, and assigns a relationship to an existing users
      + this endpoint store job data in the local database, this is required because the current free jobboard API does not have a search by ID endpoint Available to return specfic jobs for our users
  + Get `/jobs/id/houses`
    + returns an index of houses that meet the 30% income affordability criteria
      + this endpoint current only returns test data for Houston Texas, Mock data. this is a limitation of the Free nature of the API.  If i paid version were subscribed to, this feature would automatically expand

  + Post `/jobs/houses`
    + creates a `user_job_house` relationship with a house_id from the API, a Job_id, and a user email from the joins table in the database
  + Get `/jobs/houses`
    + when given params[:email]&params[:job_id]
      + returns a list of all a users homes saved to a specfic job
  + Delete `/user/:id/jobs/:id`
    + destroys a user_job relationship

## Versions
* Ruby version - 2.7.4
* Rails - 5.2.7

## DB Schema
![schema](app/assets/images/schema.png)
## CONTRIBUTORS
* [Aedan](https://github.com/aedanjames)
* [Eldridge](https://github.com/Eldridge-Turambi)
* [Austin](https://github.com/AustinCMoore)
* [Sam](https://github.com/samlsmith424)
* [Richard](https://github.com/RichardLaBrecque)
